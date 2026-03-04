Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEAE372EC3
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 22:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.227.64.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772662483; cv=none; b=IwdpGMjqqGOw7wxplnZAraujneyyRzunmCf97Knzq9QigDWfqAhvSmptn60c9MYOkyPg7GQyhhAkcmrWbxM+/dnTLYXHmNVDIB+IBVuMx5G7CWYsdwGWtwHhJA6LsL/O+DjTxz5YSOYjyptFlWo2euLSk+/iSliUNNptQlFVLfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772662483; c=relaxed/simple;
	bh=KaVX0a3ec1E1mPOuLzeGqpSngNTVij0Jo0HkcK08M+w=;
	h=Date:Message-ID:In-Reply-To:References:Subject:MIME-Version:
	 Content-Type:From:To:Cc; b=BL71GdwpwAGdkxPaUZsN0r3AX0lUoA9RoZtG/nSvZZYILHzJkB8F8atUw/CvW+Cun5zm7mLD1klImvQzdwrIrxqszJb+3Tz5g/7DRCTxD8AbBN0a1FALJdri3IqfDGP37PbcJJpg9x2rJMcvhzyh2GNGYDiAeJYnI/4F/nP/tc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rere.qmqm.pl; spf=pass smtp.mailfrom=rere.qmqm.pl; dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b=aRy9lSfY; arc=none smtp.client-ip=91.227.64.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rere.qmqm.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rere.qmqm.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="aRy9lSfY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1772661924; bh=KaVX0a3ec1E1mPOuLzeGqpSngNTVij0Jo0HkcK08M+w=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:From;
	b=aRy9lSfYFe2aBJLhf1RJx4Dw7Gl5RGyX/YQQV0psACtKdZJnAgih9syJOyXQaxyCB
	 8DlQToqpBI5EKo9JW94YoFdSkQlCbU6UocrQZalqcdgjosK42G7cQU610XFmNFEjX3
	 5cyRUnhdZq0WS/fnbzVHscSYwgcVyYunFtfk1IVA/trWqSWszBmm8vvu6AYKOH6Q6D
	 1B92Q28VuAbQwU7R4LoJF87M1DfAmbLl3rmZqvwsVCPpGl/Rchz5TtVIH3T/NvfjJ4
	 SLM6lDsOMstOyJEJlluLnrNe41f4WyevTMCLlN+05swJ2b5kR1QE63+5vd1K9X/hT2
	 /9qKWjM+Mt41A==
Received: from remote.user (localhost [127.0.0.1])
	by rere.qmqm.pl (Postfix) with UTF8SMTPSA id 4fR6DN5vSkzc1;
	Wed, 04 Mar 2026 23:05:24 +0100 (CET)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.4.3 at mail
Date: Wed, 04 Mar 2026 23:05:24 +0100
Message-ID: <9fb8ec21293205786e5a732f1ef0f3646227d1d0.1772661800.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <c7a3a0b6c1658a8ce4cc5962de18c5b2cdbcdb8f.1772661800.git.mirq-linux@rere.qmqm.pl>
References: <c7a3a0b6c1658a8ce4cc5962de18c5b2cdbcdb8f.1772661800.git.mirq-linux@rere.qmqm.pl>
Subject: [PATCH 2/5] hwmon: gigabyte_waterforce: fix PWM duty cycle
 calculation
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From:	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
To:	Aleksa Savic <savicaleksa83@gmail.com>
Cc:	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org

HW reports duty as 0-255 and sysfs expects the same. There is no need
for scaling - remove it to avoid > bogus 100% duty cycle reports.

This fixes `sensors` output for PWMs on my board with Waterforce II.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/hwmon/gigabyte_waterforce.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/gigabyte_waterforce.c b/drivers/hwmon/gigabyte_waterforce.c
index ecefac756a19..06eae143bc4e 100644
--- a/drivers/hwmon/gigabyte_waterforce.c
+++ b/drivers/hwmon/gigabyte_waterforce.c
@@ -179,7 +179,7 @@ static int waterforce_read(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_pwm:
 		switch (attr) {
 		case hwmon_pwm_input:
-			*val = DIV_ROUND_CLOSEST(priv->duty_input[channel] * 255, 100);
+			*val = priv->duty_input[channel];
 			break;
 		default:
 			return -EOPNOTSUPP;
-- 
2.47.3

