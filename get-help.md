---
layout: page
title: Get Help
---
<div class="container">
  <div class="row">
    <div class="col-lg-6">
      <h2 class="section-heading text-left">Contact Us.</h2>
      <h3 class="section-subheading">
        support@mastiffsystems.com<br>
        (402) 803-1122
      </h3>
    </div>
    <div class="col-lg-6">
      <form id="contactForm" action="https://formspree.io/f/mwpkkwzw" novalidate="novalidate" method="POST">
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
            <input type="hidden" name="_subject" id="email-subject" value="Contact Form Submission">
            <div id="success"></div>
            <button id="sendMessageButton" class="btn btn-primary btn-xl text-uppercase" type="submit">Send Message</button>
        <input type="text" name="_gotcha" style="display:none">
        <input type="hidden" name="_next" value="#" />
      </form>
    </div>
  </div>
</div>