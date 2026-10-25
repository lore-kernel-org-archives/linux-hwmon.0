Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897575;
	b=xZS4cwlYdyFdbv8EQ2uW8FLAmgFYWDhXXhhQz3yyMCwzzVeTu7EKLvaYb71IroLjuHwx
	 OYXwdfiPIwWp9TdIh/h/H/F/N6f3oZbnzcOafrDQh+usY+epHh4iIUewlJ5qcYSRFTXk7
	 Pe2CqJ+r4ytS9hr8M/FI508ORuPJMBKlWmVE+hEYxkzSI2nZoWUhlkxWlffGcsgWPx1SY
	 uarzFTi+Q+O4guPPxMnb1TbYsA53rQiOz57RuCA6u9hU5NkmQB2ss5TRyCu1kcVw0F0XS
	 ackBG8FiMHJPFoQp8e3vWJxbel5+Oer1AFPLPYzxhIERdSZGnGDObkJAInJywlCixQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=3WaQqS25spNsxL4w/1bJSObHZxRnTWLajGgDREChJ7c=;
	b=IucIRhUx86rS7fEfQQfxbp45ZRUrZTFyoxR8Zvj0mrLJMJjaFZo+2PJVLK9W3bAFNU1q
	 9K02j2CpkJawlr/5usWWkdsHUOe53mfUjA8kUDG+7X8Ocz/TVaUsC9WSQS50kxIpYz/yz
	 TFFrCOta06TpOc7OdJOef4NCIIxZumWBdP61jHD4fNP2ITyKrmyUQp+wz7Da/TbTh8JXl
	 DfSH7042FZiStaWAAefGB/UZ4ffAeR25Oomfi/RiIbtJS5JE41OEe5dZ9yE1xV9VPmBfT
	 6DIqrfx+rzc1zRUYYFA0g4jN0rStlFWurJ9BGtG5al2kw0OAfCsTY8xbYDBXo/hMELQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r84+T+Sz;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8E9606A328
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E8E9606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r84+T+Sz
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3535a54bed9so3213292eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897574; x=1793502374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WaQqS25spNsxL4w/1bJSObHZxRnTWLajGgDREChJ7c=;
        b=r84+T+Sz6Qp/XXsTS6JbFAbAJ0pyvmqxoJZ2JK/Fj2GxdZW5CLVh3D7Di3phmsdgIl
         Umaq6bc41/8/svkYYerxV71ksY2WGeYOG7gd0BGdxBuUkH3eictMEHOhdnK5TiqmQS7x
         Z/Ynh/LDsKyNPY5MSH0dKHyRGQmvr/Os0/QeF0yxKd0eqTCTSm1frUfvaScWY1mv4wj6
         Fzu+uwsQ2Ecse5Y44CAXRY9rAS5oTxFJqgDQeQPL1P06hbmme96Eg6riIvyz14NgxwFh
         J2sdAZorXhTJGLEXXhTl0LDLY9bQRjDZqOq+bvgrS3Z/9D42ObDyjpPxln1N0ybYGFpN
         3uNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897574; x=1793502374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WaQqS25spNsxL4w/1bJSObHZxRnTWLajGgDREChJ7c=;
        b=oqyZnzQQ46yoMBZX0WKlND6RaoqOwREtdssZ83Wn4rGN7ZLTH03MgL6Kxw25xtKuWG
         vW3oS8SUBDVKi5JVm6ee4ralT+wh8KJ3eRVSwmvHGo4tJ7wftfQJwd1ubeITf1+PMMlq
         oqfLd3EKRttmvo5RP6N9hMYIpb6Kdf/POYATG9y/IvCq/PkluPaPyFluNOCi28SF5VMP
         2iMpO/TP2LygqMf7S5+koc9OTDL0C/rn1Er2qsOPfRYUf2rYV3dICLmFsgNPuCq79p2/
         2X7TNf85Xk6NKrpNXPub5Zf8E9v6rSQyaVL6NcRnZDCoEhRhKZ9OUT0/d3ReuNBb/pLN
         UO3g==
X-Gm-Message-State: AFq9FYI3WjdrTKkyFOL/sGxtxkJqsX/asslWFmca2zG7vYC0+Q4pcnWo
	OEb+Qxbd50Myf1z81FprkxH60GypFrQe+tNGApUdkNkh5PAeSe+/P9ro
X-Gm-Gg: AYBFou0k4O5rCKy3TrXspbu5GCYv62+SsiAQB/eSviisU0r0dfWE/XKojb3msNtoW7U
	3YgnDObayyquzghSwVuR00cnjNHd+YAQAXm6i6I9QnkxA8f4vHPP5n3wG/e+0ulUchd5XebG5ef
	YT97eApL0MTMakPtGLM6LMSTALplA/dJAlDzzPSCve4HchSobGnTHKVfEq10XdXsDSnaCrnAuX7
	Bq0ZrAD5AaX4/GvD7172n4S9lHY2Or/6Rp4yMY//ZnqrGH3GM7hc/oEqMKL2hVfKMMnHqncq//U
	DyOAQdFIPGZntF+xi1iyunOR1AyFeXRnWmjnfSSNAUdo7Fr6NNGWtM1pcXQtc3oJPtPNUE3P9Fd
	MzKPlXdwncMvitioy4OuE/QeU+ruglsJ4cfL4h1BBfIQBmylIz8QekuPBYOnKFcFC1HH7ibgR+u
	dOIrMvtNG43FsXqKG6wdUvg5Al8vJDNr5a9LgeByiSPzh+P4bwSncQ/qKgGrZ+oYyd4iVayHTtQ
	30JLZJLmAAIvA9Tyk3M0WulWvOeppbyfv7kYWnYIpY6Q2ceC6LVyhIX8VwFsltYyMT2zQzdTeFc
	HCoZOxo0uDM6HNOC5/jzH5TpWCgGanViGI94VLHRGPY=
X-Received: by 2002:a05:693c:68c1:b0:369:f2d6:4108 with SMTP id 5a478bee46e88-369f2d66dc0mr2290762eec.10.1792897574310;
        Sat, 24 Oct 2026 20:06:14 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:13 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:07 -0700
Subject: [PATCH 04/31] hwmon: (kb9002) use 4-argument
 i2c_smbus_read_block_data()
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-4-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Andy Chung <andy.chung@amd.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Robert Marko <robert.marko@sartura.hr>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Daniel Nilsson <daniel.nilsson@flex.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Pass the size of the receive buffer to i2c_smbus_read_block_data() in
kb9002_fw_read() and kb9002_smbus_hw_read().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/kb9002.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/kb9002.c b/drivers/hwmon/kb9002.c
index 9f4521630f3a..01dedc00c3f1 100644
--- a/drivers/hwmon/kb9002.c
+++ b/drivers/hwmon/kb9002.c
@@ -183,7 +183,8 @@ static int kb9002_fw_read(struct kb9002_data *data, u16 reg, u32 *val)
 	if (ret < 0)
 		return ret;
 
-	ret = i2c_smbus_read_block_data(client, KB9002_CC_FW_READ_DATA, rbuf);
+	ret = i2c_smbus_read_block_data(client, KB9002_CC_FW_READ_DATA,
+					sizeof(rbuf), rbuf);
 	if (ret < 0)
 		return ret;
 	if (ret < (int)(sizeof(addr) + sizeof(*val)))
@@ -208,7 +209,8 @@ static int kb9002_smbus_hw_read(struct kb9002_data *data, u32 reg, u32 *val)
 	if (ret < 0)
 		return ret;
 
-	ret = i2c_smbus_read_block_data(client, KB9002_CC_HW_READ_DATA, rbuf);
+	ret = i2c_smbus_read_block_data(client, KB9002_CC_HW_READ_DATA,
+					sizeof(rbuf), rbuf);
 	if (ret < 0)
 		return ret;
 	if (ret < (int)(sizeof(addr) + sizeof(*val)))

-- 
2.56.0.257.gf7497c7d27-goog

