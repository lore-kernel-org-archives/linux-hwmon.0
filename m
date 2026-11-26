Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795693069;
	b=LCb6AJoboW6pMfzBFamgLHRqjhRkwLj7RLP/UE9PzcC5tw2IVyqyZMVFjWKUW0zeJll0
	 2z7QdQ5AZoigyEqpXTcmKj9XDNa4OOq0mN0AjHVVfq1DJ8RKL3/VxwtA8lOdEJxg+6Io0
	 JeaOeuUwrwcG454Dh+baYe3AcDhGQ4kkQYehKgCxG784Z/7ZBqQkDFcCSKEwmxQAllIkm
	 NBXZiRSV16BOSCIjickDoqqR7d7xm0UYxBRss8OvDEwSxt9YPqAm7hgvs/gEGOSNKc1QD
	 TBjRCKzg6P7CdTpJMbJGL+EmyGigWgRLj4lIcpnzU7aQ6ic00/JyjLLAU7DboJXjkgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 Received:From:In-Reply-To:References:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=heiZPI1UAatLSvjFPBofn4pTclTvh7wh2PK3/qOorq0=;
	b=RSKvsvwbsKjWCKesAccUccZK8Fpk2qQKZQXxDL4iVFb31mac9qmXWeKrbg+8gzflwfpI
	 5ydep3VAHSVnfT+rlkIre7ykfRacprrpugWAwXuQFbZFbRJdex6WnJqg/yyWa762IXTB5
	 Cv5t7Hr9lHQh92kMFtLY9qZ6bBlCh8lXdZ7G9eel5zZywqx18qYIgfAOUTgvZ6R6o53hZ
	 7u+h9qGXzSxpNLpl3UcBGiZiGUvRUXq97FpzAdQ4dunO81bAO528mdDKOggtvw2Yu9ekz
	 hgEMiCZEniSSDC52sRykm6DEJvZZXxZcGqrr4o1kRNKir7DT0jTWgY+vS4Tn2JG4JNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XHJ5JJHS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DD4606A33D
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 11:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78DD4606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XHJ5JJHS
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-55ade1de0b4so79081851cf.3
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 03:37:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795693068; cv=none;
        d=google.com; s=arc-20260327;
        b=CAe6P3sTkxia4+kmz+WcAFqziBPX0vwxFfJiL5Swm3wGR7xsOSxE+KrBcfIy0Cf/5T
         zs04D4/gqq2z9YJGNtNkgZTzyciSJ58Lt5v6i5fJjcv33G+Omj/ipHj11ZWogEW6eFEv
         +qePJphSzJvBgqylre0eTfM0XbYnMYUIFLQ0VqEfJjI9r2upVjo45/mMyJh6ttxq2ZfS
         +PsVOQGyJKU1fo4771iiCyufZIgaoMQ8inJ2eB/4HWKPHBaAStlfxsZ7QtopxIOzEfUb
         T7DeClY2SabhE532Svbz1pxskRptBM38kwm8NNwYScnA2CJDnK7Mcl0TX5ldSd64MOJO
         X1mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=heiZPI1UAatLSvjFPBofn4pTclTvh7wh2PK3/qOorq0=;
        fh=0C/NacxPb8rIaU32p77Pdl7otf8ET0q++Gp87p+c9qI=;
        b=ZIrcXc1E76cEXMhE0OASxzzUjeBqGuLLlRh7FMt6vY95/4jVUX9YPF7L9sU/dhCPi1
         3nBAT/j3DS14Wuk+1ojjsmWcuYoKRCKtvIdUqPBYgbfRlXUU+7avCofCqE1UV+UIV8Ag
         J6zaH+CUPq2WP3pj4QuaqYKoHDU3f8+D/HrjFKzq6oyK3gsPcc/abTlSQJqSJryN2051
         O7OkxZV7fgmtaRpGDpA9EgMWqxTDG6nUMzLQLgs2JU6bfV1BCmxwxnSPUStbjNuZRUUk
         pBhjH2yUzGbVDpwbT0uRE4ZlAlLkij6WpE/HaHpfDazXNjKvQYv69AiNYGRQYi86jy3s
         0rSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795693068; x=1796297868; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=heiZPI1UAatLSvjFPBofn4pTclTvh7wh2PK3/qOorq0=;
        b=XHJ5JJHSiWWkmKiO1zp+oo5IfXTeVn4o6Yd4AMvLgIY9Gv9GsLn/xXnlAr07eQ10qk
         9fSSZpY8DO2R1y7XHGW9nsJGjEMVVBj0ed13rU+7++t3wvH5oOP0llnEOCQSD+DOjzkX
         RTZTRaGskGzpkuM/TcdcjafTGFiyX4kh9ksmahM1nPlbjEtcryZmZSkU8Ejb0jsw6/Sz
         dMJbWem+t+4/9nMYCeEI4zQkg7sECBM9T2dtww3qLqVnra/TFotr5aRGJ98Mz3ing3/b
         qvB8axD+U6L8PbBRuFJKDLeQGqMPYRRmeEB08e1TmM8Yi2M6l9BoG/5OJSck8nWDoRmU
         zazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693068; x=1796297868;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=heiZPI1UAatLSvjFPBofn4pTclTvh7wh2PK3/qOorq0=;
        b=Whv4u7q5dncSEDvdNCfMeLR9c2DqxU8DlKw/KWLKVerw4BorgD0fUfSgd9N3/nkYNX
         Y9savno+LYdYAAdEzTWUamI5I/i6Pfnz4lSGiZJEfsBobn2yYzyV6y/UbEoj8miXftqF
         WHKSmycdOEllbywhhE5I0RAmnKTxp6s4uNWPZH6LRSpbCadr3oJDRqCYvCKhamCAOBJD
         mk/anCb+IQXT8469GGGmYHOwozoM2O52lU8gWXiPgEtfa01UfvC8/o5sc015f2h8FAkC
         90cgm1kU05ns+cUEgC3kppy9U/eC9pl4UIQwCnh/vymUCLok7fx0H3x4Vdv1s/lJz8b8
         WtcA==
X-Gm-Message-State: APuU4Z88kWLMIFGGcga0bvQfgKWYFxB697FjbucNhALjOfWPZVW8kf9s
	gGpUwyAg50vAIraZakFV6DaiuJGyYRVCbCPtJlAQCZx4UYIMQ38ZNfXi2BoX7HazP2GB2KsuZ/1
	XvzqwVpVjF9v10ZS/Tm52AnvlKoXI1Cb1gw==
X-Gm-Gg: AZFdTZctHpbiUxMre5FRBjSmMheyA5L5rNx6h7WJ1ELq8yyJDARqlA312fRRY/XET49
	wUQy528K4A1EHzq0zrJ46hgd3W9f/qekgoF2kM5CpUz9rHfg6gYUq8MuxoqhpTgGEABC2jfXCwY
	gT4RXPI7VRdgys6DKj4fzLpz6MOzTPwRT0iBBuV1RZUTq9zROEj7PyUAiAlsOdpReVl+XVc/O9O
	l1RBTfj00gwJai0yUkxPGZu5sxlxr5OqTn86OxETdo/YGEn4FCXCzIU+mGtHBq6DXzuVBQuPHgA
	oQYnZmnJ3dQR1WoPCeKViVLLYxeVrVlrZ7tM88cTNS/eUo95dQ8ue7Gsn/ave19uv6MVvpUns8V
	ozM2d6TgeRTYQEU+05Ek6q0KHEnOG/A/vHCCiew==
X-Received: by 2002:a05:622a:4d96:b0:535:232f:ca25 with SMTP id
 d75a77b69052e-55d7698efbemr381422711cf.7.1795693068459; Thu, 26 Nov 2026
 03:37:48 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 11:37:47 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 05:37:44 -0600
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Thu, 26 Nov 2026 11:37:39 +0000
From: jdenheijer74@gmail.com
In-Reply-To: <CAP-m2G6VwPqTOZ_uQEAsWnb=j4yFj+_N0V33gOTL5kRYwwYbvg@mail.gmail.com>
References: <CAP-m2G6VwPqTOZ_uQEAsWnb=j4yFj+_N0V33gOTL5kRYwwYbvg@mail.gmail.com>
Date: Thu, 26 Nov 2026 11:37:47 +0000
X-Gm-Features: Aa3M54p9iHEMQ4ezOdEXPWbNZGxXoW0GXh1-5KfhN4juI9Y_NtnoIXXcHGY_STI
Message-ID: <CAP-m2G7Q2jCJdqqkb_qFR4_-M2kJwE-2CSuT-5OhEGHhE-ujOw@mail.gmail.com>
Subject: [RFC PATCH 1/3] hwmon: (asus-ec-sensors) propagate EC read and
 selector errors
To: linux-hwmon@vger.kernel.org
Cc: eugene.shalygin@gmail.com, linux@roeck-us.net
Content-Type: text/plain; charset="UTF-8"

On an EC or selector failure, asus_ec_block_read() can continue with a
partial buffer. A successful final bank restore then reports success,
so update_ec_sensors() publishes stale bytes.

Propagate the first error. Attempt selector restoration in its bank,
then restore the original bank. A failed restore also rejects the
update. This changes the failure path for all supported boards.

Signed-off-by: John den Heijer <jdenheijer74@gmail.com>
---
 drivers/hwmon/asus-ec-sensors.c | 39 ++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index d0c01b825..6e06256a5 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -1309,7 +1309,7 @@ static int asus_ec_bank_switch(u8 bank, u8 *old)
 static int asus_ec_block_read(const struct device *dev,
 			      struct ec_sensors_data *ec)
 {
-	int ireg, ibank, status;
+	int ireg, ibank, status, restore_status;
 	u8 bank, reg_bank, prev_bank, select, prev_select;
 	bool select_saved;

@@ -1330,7 +1330,8 @@ static int asus_ec_block_read(const struct device *dev,
 	for (ibank = 0; ibank < ec->nr_banks; ibank++) {
 		if (bank != ec->banks[ibank]) {
 			bank = ec->banks[ibank];
-			if (asus_ec_bank_switch(bank, NULL)) {
+			status = asus_ec_bank_switch(bank, NULL);
+			if (status) {
 				dev_warn(dev, "EC bank switch to %d failed",
 					 bank);
 				break;
@@ -1345,24 +1346,36 @@ static int asus_ec_block_read(const struct device *dev,
 			select = register_select(ec->registers[ireg]);
 			if (select) {
 				if (!select_saved) {
-					if (ec_read(ASUS_EC_SELECT_REGISTER,
-						    &prev_select))
-						continue;
+					status = ec_read(ASUS_EC_SELECT_REGISTER,
+							 &prev_select);
+					if (status)
+						goto restore_select;
 					select_saved = true;
 				}
-				if (ec_write(ASUS_EC_SELECT_REGISTER, select))
-					continue;
+				status = ec_write(ASUS_EC_SELECT_REGISTER, select);
+				if (status)
+					goto restore_select;
 			}
-			ec_read(register_index(ec->registers[ireg]),
-				ec->read_buffer + ireg);
+			status = ec_read(register_index(ec->registers[ireg]),
+					 ec->read_buffer + ireg);
+			if (status)
+				goto restore_select;
 		}
+restore_select:
 		/* restore the selector while still in its bank */
-		if (select_saved &&
-		    ec_write(ASUS_EC_SELECT_REGISTER, prev_select))
-			dev_warn(dev, "EC selector restore failed");
+		if (select_saved) {
+			restore_status = ec_write(ASUS_EC_SELECT_REGISTER,
+						  prev_select);
+			if (!status)
+				status = restore_status;
+		}
+		if (status)
+			break;
 	}

-	status = asus_ec_bank_switch(prev_bank, NULL);
+	restore_status = asus_ec_bank_switch(prev_bank, NULL);
+	if (!status)
+		status = restore_status;
 	return status;
 }

-- 
2.53.0
