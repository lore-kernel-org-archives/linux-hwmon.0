Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F566209F43;
	Wed, 10 Jun 2026 18:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114512; cv=none; b=UvL+yes/XBBMMTfC6Cc8BdDa69UDIZz0nZ8nld2Ha2KPVmS5/gCi6BzdfD9H7SSMjl63I0Y8Tg2cLI9wgcIjm/JyA7q7oS3LMhCPQcjDRKWGvEvBhIFGE99F5JDqOkZ3tX33LDCsuKgJVLs5LtANkHK4a8KX74hyVUKj3TXz8ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114512; c=relaxed/simple;
	bh=WEPIxjrAIWstgYWujOk5udUVIAHCXmgi5Z9UtLWAbO4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uoJZtDii8n/0IIMr8hHC3Mzus9IIIPUJNafFGFn4axQNPdyrfRdj5/4Q80yw5U3s89VctrYEB5zPEN3nQt+sYVhkmZ9EAn3JFgTie84M8LaBbu2A5qZf69TSYY9980vECmxsseIJtIN8Hg8wB5Rp+uXIgfdCXP1R6mkDZ9T97YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=KM9YoCl7; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="KM9YoCl7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781114504; x=1781719304; i=w_armin@gmx.de;
	bh=p8UZ24VBg4YAWyTvJYJ2d/zd+4BGXgb0JxmYoecgSVs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KM9YoCl7VPxIFPL28g3IP+HBmPJA9qO9hmOFXFv1ULuAI0feFULKWM6vN3sQS9kb
	 1mXmsTtHFz9gcvfJNBDGB/sqf4YfebTk418cmq6mr6gFPWvRTjkZCnfuaNHClTvU4
	 Qw1Su9MYJJW/bfzKqIqT/lfmtwYxFbjH3i/IcB/bhxh/RW5N7QDdmbv81e+irvKEz
	 oxQ2p49CYaHXLE6qYRkMY2nnBVM2pqywnYsY9JGYOlB1boWtFFHizhrripT/jzbkr
	 v0JQxZj5XFN75LtpB/5wC/aWHll4zuL+P0bP4i0B+mG5WJpWnQuIOqeDLpscizBuN
	 Q6bZz91CchB4dvd2Kw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mo6qv-1x06Ed22qh-00o904; Wed, 10
 Jun 2026 20:01:44 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: pali@kernel.org
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (dell-smm) Add Dell Latitude 7530 to fan control whitelist
Date: Wed, 10 Jun 2026 20:01:41 +0200
Message-Id: <20260610180141.311503-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EXXwo7plAhp7fARdz/CXY25O6CqxozrPv6rE68SSyJ6lTTXYknk
 RmWCa3NnMSRR2yFgrDjIopx/rYLMP+JBMn2Bt4iw0f6FbXSAgrn1xHXalVGHdBjCAP9J/Ty
 jyzjl+glgyHlSPL7qg1I6Bl/1G7fU/ZHaoRNqtSD588yUKuodXrgwPO3f8xhRkpPAk/dtFV
 /DGxrIX0sdO5YVUtJxZdQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/lHXWUnAZJk=;uaM2s2FxRf6HOdaoC0ezukvBxQ3
 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

A user reported that the Dell Latitude 7530 needs to be whitelisted
for the special SMM calls necessary for globally enabling/disabling
BIOS fan control.

Closes: https://github.com/Wer-Wolf/i8kutils/issues/17
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 038edffc1ac7..9cec0c769e8a 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1574,6 +1574,14 @@ static const struct dmi_system_id i8k_whitelist_fan=
_control[] __initconst =3D {
 		},
 		.driver_data =3D (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
 	},
+	{
+		.ident =3D "Dell Latitude 7530",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 7530"),
+		},
+		.driver_data =3D (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
+	},
 	{
 		.ident =3D "Dell Latitude E6440",
 		.matches =3D {
=2D-=20
2.39.5

