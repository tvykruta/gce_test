package org.myorg;
	
        import java.io.ByteArrayInputStream;
	import java.io.IOException;
	import java.util.*;
	
import org.apache.hadoop.fs.*;
	import org.apache.hadoop.fs.Path;
	import org.apache.hadoop.conf.*;
	import org.apache.hadoop.io.*;
	import org.apache.hadoop.mapred.*;
	import org.apache.hadoop.util.*;

        import javax.xml.stream.XMLInputFactory; 
        import javax.xml.stream.XMLStreamConstants; 
        import javax.xml.stream.XMLStreamReader;

	
	public class WordCount {
	
	   public static class Map extends MapReduceBase implements Mapper<LongWritable, Text, Text, IntWritable> {
	     private final static IntWritable one = new IntWritable(1);
	     private Text word = new Text();
	
	     public void map(LongWritable key, Text value, OutputCollector<Text, IntWritable> output, Reporter reporter) throws IOException {
// test xml code
        try {
        String document = value.toString();
        System.out.println("‘" + document + "‘");
            XMLStreamReader reader =
                XMLInputFactory.newInstance().createXMLStreamReader(new
                        ByteArrayInputStream(document.getBytes()));
            boolean inside = false;
            String currentElement = "";
            while (reader.hasNext()) {
                int code = reader.next();
                switch (code) {
                case XMLStreamConstants.START_ELEMENT:
                    currentElement = reader.getLocalName();
                    System.out.println("startelement: " + currentElement);
                    if (currentElement.equalsIgnoreCase("characteristics")) {
                      inside = true;
                      String nodule_count = "nodule_count";
                      output.collect(new Text(nodule_count), one);
                    }
                    break;
                case XMLStreamConstants.END_ELEMENT:
                    currentElement = reader.getLocalName();
                    if (currentElement.equalsIgnoreCase("characteristics")) {
                      inside = false;
                    }
                    break;
                case XMLStreamConstants.CHARACTERS:
                    if (!inside) break;
                    String characteristic = currentElement + '_' + reader.getText();
                    output.collect(new Text(characteristic), one);
                    break;
                }
            }
        reader.close();
        } catch(Exception e){
            throw new IOException(e);
        }
// end test code

	       String line = value.toString();
	       StringTokenizer tokenizer = new StringTokenizer(line);
	       while (tokenizer.hasMoreTokens()) {
	         word.set(tokenizer.nextToken());
	         //output.collect(word, one);
	       }
	     }
	   }
	   public static class Reduce extends MapReduceBase implements Reducer<Text, IntWritable, Text, IntWritable> {
	     public void reduce(Text key, Iterator<IntWritable> values, OutputCollector<Text, IntWritable> output, Reporter reporter) throws IOException {
	       int sum = 0;
	       while (values.hasNext()) {
	         sum += values.next().get();
	       }
	       output.collect(key, new IntWritable(sum));
	     }
	   }
	
public class NonSplittableTextInputFormat extends TextInputFormat {
    @Override
    protected boolean isSplitable(FileSystem fs, Path file) {
        return false;
    }
}
	   public static void main(String[] args) throws Exception {
	     JobConf conf = new JobConf(WordCount.class);
	     conf.setJobName("wordcount");
             
             // RUn on local machine (comment out to run clustered) 
             conf.set("mapred.job.tracker", "local");
	
	     conf.setOutputKeyClass(Text.class);
	     conf.setOutputValueClass(IntWritable.class);
	
	     conf.setMapperClass(Map.class);
	     conf.setCombinerClass(Reduce.class);
	     conf.setReducerClass(Reduce.class);
	
	     conf.setInputFormat(TextInputFormat.class);
	     conf.setOutputFormat(TextOutputFormat.class);
	
	     FileInputFormat.setInputPaths(conf, new Path(args[0]));
	     FileOutputFormat.setOutputPath(conf, new Path(args[1]));
	
	     JobClient.runJob(conf);
	   }
	}
	
