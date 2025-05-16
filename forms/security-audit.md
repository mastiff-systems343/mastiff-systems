---
layout: page
title: Security Audit
---
### Security Audit

  <form
    action="https://formspree.io/f/xkgolgqe"
    method="POST">
      <!--name="sentMessage"-->
                  <div class="row">
                    <div class="col-lg-12">
                      <div class="form-group">
                        <input name="_replyto" class="form-control" id="email" type="email"
                          placeholder="Email*"
                          required="required" data-validation-required-message="Please enter your email address.">
                        <p class="help-block text-danger"></p>
                      </div>
                      <div class="form-group">
                        <input name="name" class="form-control" id="name" type="text"
                          placeholder="Business Name*"
                          required="required" data-validation-required-message="Please enter your name.">
                        <p class="help-block text-danger"></p>
                      </div>
                      <div class="form-group">
                        <input name="phone" class="form-control" id="phone" type="tel"
                          placeholder="Phone Number*"
                          required="required" data-validation-required-message="Please enter your phone number.">
                        <p class="help-block text-danger"></p>
                      </div>
                      <div class="form-group">
                        <input name="number" class="form-control" id="phone" type="tel"
                          placeholder="How many computers are in your office?*"
                          required="required" data-validation-required-message="Please enter your phone number.">
                        <p class="help-block text-danger"></p>
                      </div>
                      <div class="form-group">
                        <p>Operating Systems</p>
                        <input type="checkbox" id="OS1" name="OS1" value="Windows">
                        <label for="OS1"> Windows</label><br>
                        <input type="checkbox" id="OS2" name="OS2" value="Mac">
                        <label for="OS2"> Mac</label><br>
                        <input type="checkbox" id="OS3" name="OS3" value="Linux">
                        <label for="OS3"> Linux</label><br>
                        <input type="checkbox" id="OS4" name="OS4" value="IOS">
                        <label for="OS4"> IOS</label><br>
                        <input type="checkbox" id="OS5" name="OS5" value="Android">
                        <label for="OS5"> Android</label><br>
                        <input type="checkbox" id="OS6" name="OS6" value="Other">
                        <label for="OS6"> Other</label>
                      </div>
                      <div class="form-group">
                        <p>Do you need physical security audited?</p>
                        <select name="services" id="services">
                        <option value="yes">Yes</option>
                        <option value="no">No</option>
                      </select>
                      </div>
                      <div class="form-group">
                        <p>Who is your email provider?</p>
                        <select name="services" id="services">
                        <option value="microsoft/exchange">Microsoft/Exchange</option>
                        <option value="google/email">Google/Email</option>
                        <option value="internetservice">Provided by internet service</option>
                        <option value="other">Other</option>
                      </select>
                      </div>
                      <div class="form-group">
                        <p>Do we need to test for Phishing attacks?</p>
                        <select name="services" id="services">
                        <option value="yes">Yes</option>
                        <option value="no">No</option>
                        <option value="idk">I don't know</option>
                      </select>
                      </div>
                      <div class="form-group">
                        <p>Do you have Active Directory?</p>
                        <select name="services" id="services">
                        <option value="yes">Yes</option>
                        <option value="no">No</option>
                        <option value="idk">I don't know</option>
                      </select>
                      </div>
                      <div class="form-group">
                        <p>Do you need your website audited for security?</p>
                        <select name="services" id="services">
                        <option value="yes">Yes</option>
                        <option value="no">No</option>
                      </select>
                      </div>
                      <div class="form-group">
                        <p>How is your website hosted?</p>
                        <select name="services" id="services">
                        <option value="sq">Squarespace</option>
                        <option value="wp">Wordpress</option>
                        <option value="other">Other</option>
                      </select>
                      </div>
                      <div class="form-group">
                        <p>Do you need to be HIPPAA compliant?</p>
                        <select name="services" id="services">
                        <option value="yes">Yes</option>
                        <option value="no">No</option>
                      </select>
                      </div>
                      <div class="form-group">
                        <p>Do you have managed Antivirus?</p>
                        <select name="services" id="services">
                        <option value="yes">Yes</option>
                        <option value="no">No</option>
                      </select>
                      </div>
                      <div class="form-group">
                        <textarea name="message" class="form-control" id="message"
                          placeholder="What are your main goals and concerns of the security audit?*"
                          required="required" data-validation-required-message="Please enter a message."></textarea>
                        <p class="help-block text-danger"></p>
                      </div>
                    <input type="hidden" name="_subject" id="email-subject"
                      value="Contact Form Submission">
                    <div class="clearfix"></div>
                    <div class="col-lg-12 text-center">
                      <div id="success"></div>
                      <button id="sendMessageButton" class="btn btn-primary btn-xl text-uppercase"
                        type="submit">Send Message</button>
                    </div>
                    <input type="text" name="_gotcha" style="display:none">
                    <input type="hidden" name="_next" value="#" />
                  </div>
              </div>

