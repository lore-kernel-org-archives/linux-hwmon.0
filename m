Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5884B3EB7E9
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 11:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536031; cv=none; b=LMDFwqPSOnczN0OtvMhfHEuKwVFarUh40fhKFrZKNY62b1dkvWNS6DViy/bScY7/C69FIaSVbeIF08+KjFOe37sA3syYGXTz7vf4+V9WgeZ/lWzzScFg8hOZnfXdmVbZXH1o5s60xw5JxmVMFpnAOiTn7uDyuI9239hkfnHHH8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536031; c=relaxed/simple;
	bh=4lNzrkLwskR6oc08EN5+rjmwQK5jtlDC3ZToC+2JUxg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rksgm8d+Oog6B4e8iTUF7tlsFlxI46DMcmK4gLAgUdG7EzzNzMpqnnGI0DvvjwpXti49EN6LFR2cXUGBloptPPtu+prvBYFI3ZKZzwyUdnc5ntb4coTNaXK4CFaJ3oY1cHLAdC/RwXHM4sQtgL3Y/BkDPnWbbFJCpv6ViS/60IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1vxNak-0002HT-I7; Tue, 03 Mar 2026 12:07:06 +0100
From: Jonas Rebmann <jre@pengutronix.de>
Subject: [PATCH 0/2] hwmon: ina2xx conistency improvements
Date: Tue, 03 Mar 2026 12:07:00 +0100
Message-Id: <20260303-ina234-shift-v1-0-318c33ac4480@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANTApmkC/x3MQQqAIBBA0avIrBNMzaCrRAvTMWdjoRGBePek5
 Vv8X6FgJiywsAoZHyp0po5xYOCiTQdy8t0ghTRCCcUpWak0L5HCzZ01O+opaDt76MmVMdD779a
 ttQ/8094gXgAAAA==
X-Change-ID: 20260303-ina234-shift-ca6be45f4a7d
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.15-dev-7abec
X-Developer-Signature: v=1; a=openpgp-sha256; l=855; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=4lNzrkLwskR6oc08EN5+rjmwQK5jtlDC3ZToC+2JUxg=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYshcduCqvveWPt8Vxf/WcbYV2/5oP/934+fpa+w/mt4Ia
 z+zrYhzRUcpC4MYF4OsmCJLrJqcgpCx/3WzSrtYmDmsTCBDGLg4BWAiW48yMuyK03Xft3X7c5EV
 Pw6HfJ3HMskjsV94meqimS01EU1WctcZfrNd75xYx7PJ9WpC1+3Pbml3t3SkC3J3On6V/+fFul8
 mngcA
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

While working on INA234 support in the ina2xx.c, I think I found some
inconsistencies: An unused macro, outdated comments, and different
approaches to accounting for zero-reserved LSBs in INA234 registers.

These aren't functional changes and it was verified that measurements
are correct as before on INA234.

Ian Ray <ian.ray@gehealthcare.com>

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
Jonas Rebmann (2):
      hwmon: (ina2xx) clean up unused macro and outdated comment
      hwmon: (ina2xx) Shift INA234 shunt and current registers

 drivers/hwmon/ina2xx.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)
---
base-commit: f08c5de5f61a117ba5326d3d5b86e884077da2d0
change-id: 20260303-ina234-shift-ca6be45f4a7d

Best regards,
--  
Jonas Rebmann <jre@pengutronix.de>

