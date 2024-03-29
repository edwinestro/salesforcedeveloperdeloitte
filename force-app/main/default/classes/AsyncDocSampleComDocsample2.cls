//Generated by wsdl2apex

public class AsyncDocSampleComDocsample2 {
    public class EchoStringResponse_elementFuture extends System.WebServiceCalloutFuture {
        public String getValue() {
            docSampleComDocsample2.EchoStringResponse_element response = (docSampleComDocsample2.EchoStringResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.EchoStringResult;
        }
    }
    public class AsyncDocSamplePort {
        public String endpoint_x = 'http://YourServer/YourService';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://doc.sample.com/docSample', 'docSampleComDocsample2'};
        public AsyncDocSampleComDocsample2.EchoStringResponse_elementFuture beginEchoString(System.Continuation continuation,String input) {
            docSampleComDocsample2.EchoString_element request_x = new docSampleComDocsample2.EchoString_element();
            request_x.input = input;
            return (AsyncDocSampleComDocsample2.EchoStringResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncDocSampleComDocsample2.EchoStringResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'urn:dotnet.callouttest.soap.sforce.com/EchoString',
              'http://doc.sample.com/docSample',
              'EchoString',
              'http://doc.sample.com/docSample',
              'EchoStringResponse',
              'docSampleComDocsample2.EchoStringResponse_element'}
            );
        }
    }
}