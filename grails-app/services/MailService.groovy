import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.core.io.UrlResource;

import javax.mail.internet.MimeMessage;

import resume.*

class MailService{
	
	MailSender mailSender
	SimpleMailMessage messageTemplate
	
	def sendResumes = { ids ->
		
		MimeMessage message = mailSender.createMimeMessage();

		MimeMessageHelper helper = new MimeMessageHelper(message, true);
		helper.setTo("davidadale@gmail.com");
		helper.setText("Check out these resumes!");		
		
		ids?.each(){
			Resume resume = Resume.get( it)
			UrlResource resource = new UrlResource("http://localhost:8080/resume/pdf/show?url=/resume/show/${it}");
			helper.addAttachment("${resume.person.fullName} - ${resume.name}.pdf", resource);			
		}
		
        try{
            this.mailSender.send(message);
        }
        catch(MailException ex) {
            // simply log it and go on...
            System.err.println(ex.getMessage());            
        }		
		
		
	}
	
	def sendResume = { resume, emailTo, subject, txtMessage ->
		
		MimeMessage message = mailSender.createMimeMessage();




		// use the true flag to indicate you need a multipart message
		MimeMessageHelper helper = new MimeMessageHelper(message, true);
		helper.setTo( emailTo.split(","));
		helper.setSubject( subject )
		helper.setText( txtMessage );

		// let's attach the infamous windows Sample file (this time copied to c:/)
		UrlResource resource = new UrlResource("http://localhost:8080/resume/pdf/show?url=/resume/show/${resume.id}");
		helper.addAttachment("${resume.person.fullName}.pdf", resource);
		
		
	        try{
	            this.mailSender.send(message);
	        }
	        catch(MailException ex) {
	            // simply log it and go on...
	            System.err.println(ex.getMessage());            
	        }		
		
	}
	
}