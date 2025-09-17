---
layout: page
title: Get Help
---
<br>
<div class="container">
  <div class="row">
    <div class="col-lg-6">
      <h2 class="section-heading text-left">Contact Us.</h2>
      <p class="section-subheading">
        support@mastiffsystems.com<br>
        (402) 803-1122
      </p>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
<p><strong>How-to</strong></p>
<a href="{{ site.baseurl }}/get-help/how-to/">How to find your computer name</a><br>
<a href="{{ site.baseurl }}/get-help/dwservice/">How to use DWService to remote to a shared computer</a><br>
<a href="{{ site.baseurl }}/get-help/password-pusher/">How to send password securely using Mastiff Password Pusher</a>
</div>
    <div class="col-lg-6">
    <br>
<form
  action="https://formspree.io/f/xzzdlzja"
  method="POST"
>
            <div class="form-group">
              <input name="name" class="form-control" id="name" type="text" placeholder="Name*" required="required" data-validation-required-message="Please enter your name.">
              <p class="help-block text-danger"></p>
            </div>
            <div class="form-group">
              <input name="company" class="form-control" id="company" type="text" placeholder="Company" data-validation-required-message="Please enter your company.">
              <p class="help-block text-danger"></p>
            </div>
            <div class="form-group">
              <input name="_replyto" class="form-control" id="email" type="email" placeholder="Email*" required="required" data-validation-required-message="Please enter your email address.">
              <p class="help-block text-danger"></p>
            </div>
            <div class="form-group">
              <input name="phone" class="form-control" id="phone" type="tel" placeholder="Phone Number" required="required" data-validation-required-message="Please enter your phone number.">
              <p class="help-block text-danger"></p>
            </div>
            <div class="form-group">
              <textarea name="message" class="form-control" id="message" placeholder="Description of Issue*" required="required" data-validation-required-message="Please enter a message."></textarea>
              <p class="help-block text-danger"></p>
            </div>
           <div class="form-group">
              <label for="file-upload" class="form-label">Attach File (optional)</label>
              <input name="attachment" class="form-control" id="file-upload" type="file">
              <p class="help-block text-danger"></p>
            </div>

            <!-- Communication Consent Checkbox -->
            <div class="form-group">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" id="communication-consent" name="communication-consent" value="yes" required>
                        I consent to being contacted regarding my inquiry via phone, email, or text message*
                    </label>
                    <small class="form-text text-muted">
                        We will only use your contact information to respond to your inquiry and provide related customer support. We do not send promotional or marketing messages.
                    </small>
                </div>
            </div>
            
            <!-- Terms and Privacy Checkbox -->
            <div class="form-group">
                <div class="checkbox">
<label>
    <input type="checkbox" id="terms-accept" name="terms-accept" value="yes" required>
    I accept the <a href="{{ site.baseurl }}/terms/" target="_blank">Terms of Service</a> & <a href="{{ site.baseurl }}/legal/" target="_blank">Privacy Policy</a>*
</label>
                </div>
            </div>

            <input type="hidden" name="_subject" id="email-subject" value="Contact Form Submission">
            <div id="success"></div>
            <button id="sendMessageButton" class="btn btn-primary btn-xl text-uppercase" type="submit">Send Message</button>
        <input type="text" name="_gotcha" style="display:none">
        <input type="hidden" name="_next" value="#" />
      </form>
    </div>
  </div>
</div>