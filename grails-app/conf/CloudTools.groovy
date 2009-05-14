import net.chrisrichardson.ec2deployer.cluster.*
import net.chrisrichardson.ec2deployer.core.*

cloudTools {

   awsPropertiesFile = "/Users/daviddale/cloudtools/aws.properties"

   // The name of the cluster
   // The plugin creates a file called ~/.cloudtools/<clusterName>.xml directory

   clusterName = "grails-cluster"

   // Specify the configuration of the cluster

   clusterSpec = new ClusterSpec()
                .tomcats(1)
                .topology("SingleInstanceTopology")
                .instanceType(EC2InstanceType.SMALL)
                .slaves(0)
                .bucketPrefix(System.getProperty("grails.env"))
                .catalinaOptsBuilder("""{builder, databasePrivateDnsName, slaves ->
                                        builder.arg("-Xmx500m")
                                        builder.prop("com.sun.management.jmxremote")
                                        builder.prop("com.sun.management.jmxremote.port", 8091)
                                        builder.prop("com.sun.management.jmxremote.authenticate", false)
                                        builder.prop("com.sun.management.jmxremote.ssl", false)
                                        builder.prop("ptrack.application.environment", "ec2")
                                        builder.prop("log4j.configuration", "log4j-minimal.properties")
                                        builder.prop("jdbc.db.server", databasePrivateDnsName)}""")
                .schema("ptrack", ["ptrack": "ptrack"], [])


}

