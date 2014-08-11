import org.apache.spark.SparkContext
import org.apache.spark.mllib.classification.SVMWithSGD
import org.apache.spark.mllib.regression.LabeledPoint

// Load and parse the data file
val data = sc.textFile("gs://bucket-tvykruta/datasets/natality_features/*")
val parsedData = data.map { line =>
  val parts = line.split(',')
  LabeledPoint(parts(0).toDouble, parts.tail.map(x => x.toDouble).toArray)
}

// Run training algorithm to build the model
val numIterations = 2
val model = SVMWithSGD.train(parsedData, numIterations, 0.025, .1, 1.0,
    Array[Double](1, 1, 1, 1, 1, 1, 1))

// Evaluate model on training examples and compute training error
val labelAndPreds = parsedData.map { point =>
  val prediction = model.predict(point.features)
  (point.label, prediction)
}
val trainErr = labelAndPreds.filter(r => r._1 != r._2).count.toDouble / parsedData.count
println("Training Error = " + trainErr)

