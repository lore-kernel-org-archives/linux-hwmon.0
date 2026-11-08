Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794096098;
	b=DYAwKOAiRMBmC4pTSdIgPSIrKxwLpv5aj7VYtUOYJIWvIoHQUmA7GZYSne5ndpIUiSeU
	 C3mmQIHhIvswSq3FK1e5rJPKMCvxiNNYqkngtXD4sbIetIVWFDCu/iOB5JFRM2NzGl75/
	 J/Eyhobr8IoXyJpt/veI4TCButP+5K4XneRlrnnAxIaTbT8GCnrQe5IbCLZup44lSszJL
	 gtN2UnkHCM2FcOaggW0G0qnYXNYXfqGNwm3oZTsK5XBna4RBBOE2P5yxOq6+kYGM36ODh
	 MUEHAvtoflr7Nz4qAQWuDgmhwxf2hFkOdYxvuT+QFcrMDpvcJYu69XP/4bb2psuHyhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794096098;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=l/pbC+9Ugnb81BIrv/OBuT9Kp7O04deOkryQUsTgWfA=;
	b=T8a09/OP/2GjnmrBqHex8ziW6fbMolE6F/BKFFfg8UfNNgdgQkRQog34coaAuIl4LDll
	 I30EOUU1ETW0GJvUamE/LruYP0vp9sYsT6Eq1xMdUFMiViMNiR1jvlvODB95PIaES7fon
	 V6yWYbOOtADq9EMe9TpNId3ah6iSPJwe5+bUmv0Z1gE+jjtBruG3qNlfBoN+yeTJgmZKv
	 k2jh0xTDchZX/JngYJG+GqVRe0PTlZaUhDnCpeXH/6IVO9xMNZXGFJo2N9KsbtFwN5UOp
	 n6KUQkLVTtrhiE9jik9lSHzeTboCK2rHRRaRK15DqF/AmMgSzqeo5wAf5tuAoA7phhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=4fQqNCyT;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5B8606A326
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 00:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD5B8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=4fQqNCyT
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id PNuyxMvlhJFmFPqLoxuHUW; Sun, 08 Nov 2026 00:01:37 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id PqLox7gL8Gh2BPqLox39jM; Sun, 08 Nov 2026 00:01:36 +0000
X-Authority-Analysis: v=2.4 cv=Aszu3P9P c=1 sm=1 tr=0 ts=6aefbbe0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=9nlX8u58z_dUKZMZ3LoA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=l/pbC+9Ugnb81BIrv/OBuT9Kp7O04deOkryQUsTgWfA=; b=4fQqNCyTbbwK
	A0cCY/YgC6d9BGYYDA+tjXcqpccHa0C3jSgztky1T67NrZ5kqfvG8itkEA7oP7MM6FB81cxhX7jDS
	QYrsk1dIY+SftvRWURymIo5T99T1mscq1V0Xgvy2BnI9uO0BNN5uTfl19vpU1DzVZtcUGkXXmqNCG
	6hpTbAfl1w829R6zG/24cyTnYQHvJxJXgxw4HXvbPMjD3Vrch818fgd5F1PKAJPc8beRh+ES5gb28
	AeQ08ysWtkNH2fwh0WIo6Jbk9P2NduIe296bCdcOIJW8GEQS4cG/TpHJUzofuzlQZWlPPX83TM9p1
	9vIxP6Tz/rKjIpsH81m2ag==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:34092 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xPqLn-00000004E2E-3ZDF;
	Sun, 08 Nov 2026 05:31:35 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Tomasz Bojanowski <tomasz@bojanowski.me>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/4] hwmon: (msi_mystic_light) Make sensor read function board specific
Date: Sat,  7 Nov 2026 16:01:30 -0800
Message-ID: <20261108000131.1249664-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261108000131.1249664-1-linux@roeck-us.net>
References: <20261108000131.1249664-1-linux@roeck-us.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xPqLn-00000004E2E-3ZDF
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:34092
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 8
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGXM81t+X+j5rd31lASPB98Z63GYz7nbEq64aLopRzNr9vxQmdO5wT3/+beAYHj3OozvYPGeTI3LIq7b1nBldrxDs5W08Yb9bbJlIXaf1NMD+DtLVZPF
 u6PMPT3A/WepI6y1jR1gPOQweFjmcmHo1LvIgZn8VhySH+/WTigua7YCU49qqNFgbDaUaPMA6GBpTtDQh1dglhsfbdZA6E6bda8CMLzM/5WMorU6Ku7pSd2h

Mystic Light controllers on different generations of MSI motherboards
use different HID communication mechanisms to retrieve voltage sensor
data. While 800-series motherboards expose sensor readings directly via
a synchronous HID_REQ_GET_REPORT request on feature report 0xf0, older
500- and 600-series motherboards require requesting sensor data via an
output report and receiving the response asynchronously as an input
event.

Add a read_report() callback to struct msi_ml_board, rename the existing
implementation to msi_ml_read_report_7e61() for MS-7E61, and turn
msi_ml_read_report() into a dispatch wrapper so probe and hwmon read
paths remain board-independent.

Cc: Tomasz Bojanowski <tomasz@bojanowski.me>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/msi_mystic_light.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/msi_mystic_light.c b/drivers/hwmon/msi_mystic_light.c
index 4b4e07f15aa8..098b4ecd0596 100644
--- a/drivers/hwmon/msi_mystic_light.c
+++ b/drivers/hwmon/msi_mystic_light.c
@@ -59,6 +59,7 @@ struct msi_ml_board {
 	const char *const *in_label;
 	/* little endian u16 in mV, offset at most MSI_ML_SENSOR_REPORT_SIZE - 2 */
 	const u8 *in_offset;
+	int (*read_report)(struct msi_ml_data *priv);
 };
 
 /*
@@ -67,7 +68,7 @@ struct msi_ml_board {
  * hwmon core serializes. No additional locking is needed for the buffer
  * and the cached values.
  */
-static int msi_ml_read_report(struct msi_ml_data *priv)
+static int msi_ml_read_report_7e61(struct msi_ml_data *priv)
 {
 	const struct msi_ml_board *board = priv->board;
 	u8 *buf = priv->buf;
@@ -98,6 +99,11 @@ static int msi_ml_read_report(struct msi_ml_data *priv)
 	return 0;
 }
 
+static int msi_ml_read_report(struct msi_ml_data *priv)
+{
+	return priv->board->read_report(priv);
+}
+
 static umode_t msi_ml_is_visible(const void *data,
 				 enum hwmon_sensor_types type, u32 attr,
 				 int channel)
@@ -265,6 +271,7 @@ static const struct msi_ml_board msi_ml_7e61 = {
 	.num_in = ARRAY_SIZE(msi_ml_7e61_in_label),
 	.in_label = msi_ml_7e61_in_label,
 	.in_offset = msi_ml_7e61_in_offset,
+	.read_report = msi_ml_read_report_7e61,
 };
 
 static const struct dmi_system_id msi_ml_dmi_table[] __initconst = {
-- 
2.45.2

