<?php
	include "model/survey.php";
?>

<section class="w3l-breadcrumb py-5">
  <div class="container">
      <div class="header-section">
        <h3>Contact</h3>
      </div>
  </div>
</section>
<section class="w3l-contact" id="contact">
	<div class="container py-5">
		<div class="contacts12-main py-md-3">
			<div class="header-section text-center">
				<h3 class="mb-md-5 mb-4">Send us a message</h3>
			</div>
			<form action="">
				<div class="main-input text-left">
					<input type="text" name="emailMess" id="emailMess" placeholder="Email" class="contact-input"/>
					<p id="errorEmailMess"></p>
					<input type="text" name="tbTitle" id="tbTitle" placeholder="Title" class="contact-input" />
					<p id="errorTitle"></p>
					<textarea class="contact-textarea contact-input" name="taMessage" id="taMessage" placeholder="Enter your message"></textarea>
					<p id="errorTextarea"></p>
				</div>
				<div class="text-left">
					<input type="button" value="Send" id="btnSend" name="btnSend" class="btn btn-primary theme-button"/>
				</div>
				<p class="text-left" id="errorBtnSend"></p>
			</form>
		</div>
	</div>
	<div class="container py-5">
		<div id="survey" class="contacts12-main py-md-3">
			<div class="header-section text-center">
				<h3 class="mb-md-5 mb-1">Survey</h3>
				<h5><?=$survey['question']?></h5>
			</div>
			<form action="">
				<input type="hidden" id="idSurvey" value="<?=$survey['idSurvey']?>"/>
				<?php
					foreach($answer as $a):
				?>
				<br/>
				<input type="radio" name="answer" value="<?=$a['idAnswer']?>"/>
				<?php
					if($a['idAnswer'] == $idAnswer){
						echo "checked=true";
					}
					if($idAnswer != 0){
						echo "disabled=true";
					}
				?>
				<?=$a['answerText']?>
				<br/>
				<?php
					endforeach;
				?>
				<br/>
				<input type="button" value="Submit" id="vote" class="btn btn-primary theme-button"/>
				<?php
					if($idAnswer != 0){
						echo "disabled=true";
					}
				?>
				<input type="button" value="Results" id="surveyResult" class="btn btn-primary theme-button"/>
				<p id="surveyError">
					<?php
						if($idAnswer != 0){
							echo "You've already voted! Check results.";
						}
					?>
				</p>
			</form>

			<div id="printResults">
			</div>
		</div>
	</div>
	<div class="contant11-top-bg py-5">
		<div class="container py-lg-3">
			<div class="d-grid contact section-gap">
				<div class="d-flex justify-content-center contact-info-left d-grid">
					<div class="contact-info">
						<div class="icon">
							<span class="fa fa-phone" aria-hidden="true"></span>
						</div>
						<div class="contact-details">
							<h4>Phone:</h4>
							<p>+381 64 321 1399</p>
							<p>+381 63 281 4911</p>
						</div>
					</div>
					<div class="contact-info">
						<div class="icon">
							<span class="fa fa-envelope-open-o" aria-hidden="true"></span>
						</div>
						<div class="contact-details">
							<h4>Email:</h4>
							<p>info@foodster.com</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<br/><br/><br/>

