Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2260C3822B4
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Mar 2026 08:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773650414; cv=none; b=a8I0wx7/yaVavfXILlj/bCcbRQjPoYsW5MdAmu1f2f6duCWagHXkn2ThlHeahlU0ZQEIpUSMj1oCCMtpHhoGVWjYmP69rcuoRsi/RM+BA+8nCgKfTnNB47bF96neJ0vI8+jm9kHgNPH4N6LoZQeelgdarMOuAgbclgzC2/qfrzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773650414; c=relaxed/simple;
	bh=9FSuapwL6VYJkBDXuygJF37yB4ZM2TQecc51n0jy4uk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rykQV3aWsiQI+YANs4utgjuzfwHWkSjqzvp6BYBbexRLE82qQZJLQoEXuIzQ4VM3AlX82sTksLmrsJz+EPNHZTG5VAU1/OaXtCNSqtFOEZLufkD4cbGypIkGCqcWZvGwXjHjCogQssbv5yE/9hxPXBySbezyErRTo0oZd3AwXvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTcYbblg; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTcYbblg"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ab077e3f32so19380755ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Mar 2026 01:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773650410; x=1774255210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OUrKY347+cvTpzMzeKy/hfhwRp97bHtF1nhnnAOOMMo=;
        b=FTcYbblggEWkAtHJZD0mJ415sC4SxzLXZlV483cMyiEcqj1yqogsTXfoy2LYwACX+J
         N4KOumKjH71qMOxjfUnwvUiDA6qZMTvqyafnCPRlqswIcjPeOlh2R90ENIu3zukYvvZN
         Z0qp37Z4o3p2qz0vCHP/6csC/J+jZNc31oJshkbBKNuV63IMRu7kvbiziH4fN/0Ubv3m
         MyMNoEhxprIX6Yxl3pgzhS8TUAiPP0p/uHe9gl9fBtSoCMae9z5MEKF9/1kmvYY6Z9Bs
         YG+2QovSFYAqwSY9XPI2ujLdJW14BliFU+ivqxjqfiNfG7ke4tQ5X2o0TbK2JMoskf1S
         V0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773650410; x=1774255210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OUrKY347+cvTpzMzeKy/hfhwRp97bHtF1nhnnAOOMMo=;
        b=JXLB875M9VAWDc3JZWjWduAagV4JorWNkkL9hCOlDG2Q8kFlBdKb9JhyiyRptdbgYz
         87B+G+IQZaUpImvicjgEbh7ScKYY57+jyYW5/7QuIdXu1sVYyaUPvbo/n+SBlqDbzMxM
         P2y15yZmV+akpw9DeqjLS2lY+Bt1odGxrJYctKtJkDaaFAlAMUEi/dCQb9Zhhp+OHCUl
         3M/HXgeungFPkbsHbsOJK+6AHJcQQvukTk3mDjWKb65KzOxL9RxSfy0CEr4ZTRbpsxi9
         Knf53xfsjAdo4YRVxY3VnfFhu6BDkv7AyWm9yXaVramT0/69vKQh9CZ962Bgj/1ZjEV9
         rwKQ==
X-Gm-Message-State: AOJu0YzFFRA7FNEyNFV03twu1tYCj8RLN8nZTYryvw4W2jBjA9hxtKme
	xoPepJ61uyI69Veir+GgOigaVVkKsZhK3i1ZMeG2C+Q1tS4APji6osVk9p0Heyzz
X-Gm-Gg: ATEYQzywLW8Nyynsygvx0k84NK50O7g6gYu/J0hloFdIQWXvtCA4FHGqXQk3rUsmRdH
	wqVk8JtZve90cTTKf6N3Tb6S2isQmaxzGvR245FUPaC9cnu4E5N+TpCzdV+ah0jzA/KSiIPVQ2w
	ODbqfKzrJL7hR72fBW3+BpsvhHKMhoHzNC9OewRUGfNucR2adlrbXAen3DJQgElFsm0b0hCokx0
	dmJ/NSYqXA3ysjyE2sz7RoxslE7qwiz+ECA5WlJI3gfXPav1UT3FWU4hzZQqVjgQWMBjntKi6Ml
	mToZJITIkV4a46FCdSVys6z1OUJ0rKmJX+onFC+JEp5Zy3K+WMc0K4NWp7U7ZEXbFv+Y1AgZ3EZ
	+rPn8O3EoB9E65IMc+6MLSSaaNUkR5VFTS/NjXR+ZwAka5oJGwBQ/06q9NbIaI9LNp9Qbomfz+p
	PmrWSeUzBpKBNa2TpP3Ww=
X-Received: by 2002:a17:903:3905:b0:2ae:a70a:2af2 with SMTP id d9443c01a7336-2aecab1ed76mr139356135ad.29.1773650410229;
        Mon, 16 Mar 2026 01:40:10 -0700 (PDT)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0537b663csm45946865ad.51.2026.03.16.01.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:40:09 -0700 (PDT)
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 16 Mar 2026 16:39:34 +0800
Subject: [PATCH v2 2/2] hwmon: (pmbus) Add Delta Q54SN120A1 Q54SW120A7 chip
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-add-q54sn120a1-q54q54sw120a7-v2-2-60e6182cc4a7@gmail.com>
References: <20260316-add-q54sn120a1-q54q54sw120a7-v2-0-60e6182cc4a7@gmail.com>
In-Reply-To: <20260316-add-q54sn120a1-q54q54sw120a7-v2-0-60e6182cc4a7@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Colin.Huang2@amd.com, 
 Carl.Lee@amd.com, Peter.Shen@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773650402; l=2286;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=9FSuapwL6VYJkBDXuygJF37yB4ZM2TQecc51n0jy4uk=;
 b=Huug8Dk3UF2dSWSD4aGaQRdhri2+VHtZ6act3ArJCqCRfIcwBTnyjtymCejwNJNQrSn2wBDD5
 3xfUpJ6e+pVCqG2uUY8GjrI3FoLxOpq66Rq/C+6WHcynyd9a0AeAFpX
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=

Add the DELTA chips Q54SN120A1, Q54SW120A7 in q54sj108a2,
1/4 Brick DC/DC Regulated Power Module with PMBus support

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 drivers/hwmon/pmbus/q54sj108a2.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
index 4d7086d83aa3..06f9db4912d7 100644
--- a/drivers/hwmon/pmbus/q54sj108a2.c
+++ b/drivers/hwmon/pmbus/q54sj108a2.c
@@ -269,6 +269,8 @@ static const struct file_operations q54sj108a2_fops = {
 
 static const struct i2c_device_id q54sj108a2_id[] = {
 	{ "q54sj108a2", q54sj108a2 },
+	{ "q54sn120a1", q54sj108a2 },
+	{ "q54sw120a7", q54sj108a2 },
 	{ },
 };
 
@@ -278,6 +280,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
+	const struct i2c_device_id *mid;
 	enum chips chip_id;
 	int ret, i;
 	struct dentry *debugfs;
@@ -314,8 +317,12 @@ static int q54sj108a2_probe(struct i2c_client *client)
 		dev_err(dev, "Failed to read Manufacturer Model\n");
 		return ret;
 	}
-	if (ret != 14 || strncmp(buf, "Q54SJ108A2", 10)) {
-		buf[ret] = '\0';
+	buf[ret] = '\0';
+	for (mid = q54sj108a2_id; mid->name[0]; mid++) {
+		if (!strncasecmp(mid->name, buf, strlen(mid->name)))
+			break;
+	}
+	if (!mid->name[0]) {
 		dev_err(dev, "Unsupported Manufacturer Model '%s'\n", buf);
 		return -ENODEV;
 	}
@@ -325,7 +332,10 @@ static int q54sj108a2_probe(struct i2c_client *client)
 		dev_err(dev, "Failed to read Manufacturer Revision\n");
 		return ret;
 	}
-	if (ret != 4 || buf[0] != 'S') {
+	/*
+	 * accept manufacturer revision with optional NUL byte
+	 */
+	if (!(ret == 4 || ret == 5) || buf[0] != 'S') {
 		buf[ret] = '\0';
 		dev_err(dev, "Unsupported Manufacturer Revision '%s'\n", buf);
 		return -ENODEV;
@@ -402,6 +412,8 @@ static int q54sj108a2_probe(struct i2c_client *client)
 
 static const struct of_device_id q54sj108a2_of_match[] = {
 	{ .compatible = "delta,q54sj108a2", .data = (void *)q54sj108a2 },
+	{ .compatible = "delta,q54sn120a1", .data = (void *)q54sj108a2 },
+	{ .compatible = "delta,q54sw120a7", .data = (void *)q54sj108a2 },
 	{ },
 };
 

-- 
2.34.1

