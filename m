Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027DB4DA55E
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 16:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690716; cv=none; b=BMA+qaCLA9LtUBsb4ppUbOOxK8onoZmp/TLlwrRITpUz4KRIjmn5ASrm8NOP1vKIUpewv+xGMVfutWpclQiNCk8p4ol29Ox1juv9hLtEcJEmaEW9JdQHpAIpdRmCC+jtOgG0pYilJBtZOAusgL0WUgRXFsXNvAEvTI9lx1iFn4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690716; c=relaxed/simple;
	bh=dCa1DfXDPSsUHmOxzw5wMgvkvgz4NFVsX8GQXxEU/ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y7UbqQGwYyW9qrxxyz81HRS9rrVDW3Va4cz8dvmBg72fYHLqQQoEIVoCyjiZY7GHI+ZSl3XroLg35sZID46NF+prwvMFQO/SNSn7Frw0VJcd1pTyalFgvRug5ioow0SlJiVJiHuu9qJ2TT/gs1UBij1ZKGwdGhu13nhV98cctp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=EJsG9mKe; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="EJsG9mKe"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-444826c16ffso5975145f8f.1
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 09:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778690713; x=1779295513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIsVtJ8zbWLGPiaDsH7bQoduJnxgIsFUI15dF67q6CU=;
        b=EJsG9mKegEoCgM1Qv7aIuV0OYtj+Mf8sirK8A6gROAvpqGKp6qNwgTUIwswMp5oNv+
         fmB0AowMOuoC+JlZPsNdQQV/+ynwVBOb41Ic5uhOsO/ZiA5/qBkKX59kiExGKJbpt+ea
         81q2Pto37IdNtutHiIoMcLAto04f3/IRSEEndM7vg7HEsLyFs363yy9IK5uRpCmC6EZF
         IfBrcj/mp/ilyVmb52dVcwPST0QADWmScJPNmGQ/qVWCV1Iri8H0v9FxkhzW3olxWTm4
         CmQRU0t1G7eqjcGU544BW4EbHzW3be2SXaqdJPAHfpZXTNqkHN2KSY3xQf5QRuby5Ar9
         OnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690713; x=1779295513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CIsVtJ8zbWLGPiaDsH7bQoduJnxgIsFUI15dF67q6CU=;
        b=ifnpCWy8BUyv5FV6ptLmdmdO+sn0Nxp1WAD/Va5G1kVhIpi5L0qguvt5gM3UN0zIOe
         1cPQOTEssVvp246pj+bCvyVsNgyjNcoNVrhxmtB3SResaRSibhj5yAq5aCeZUlBWRU02
         syyfVi/fIrj6+8c2lD6/CYGY4fUjd98wRKMuP7a36gR/I2XWpjPb3k5oZIaz6SX0r4if
         nZOKo4XcUa0bWtZfhm1JcccVImT55sUFl7wpy9UJYMJ0fNlqOj/98l9JAPSpALEQyheJ
         nAVk/ThTFrFiVlT2PPCmzanY7UCtk8bdvvW02lIw40hB4VQKzPJ6swFyYgOqRttdUV2V
         /mrA==
X-Forwarded-Encrypted: i=1; AFNElJ9XulmDGAqYrCvweQTjt6kQZmqaeVuunsUrLP4zsxapEoSuKNj42A9Nrnoo3JWEGcWNZh8+Tk6gmoyJBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXr6IMF/xzT345JyxI5pYAuWuogHFXBhPLjnxpCFjBYcZFs7rH
	6Z1I94IFuH9umUnswVjz1CFPxg3JtEJkxJKW95hHmoDkGxT5Fc7C+KvMO8hgRMKZ4zo=
X-Gm-Gg: Acq92OE9GYrR/FCbZ2/dxh+FzJSkTns9XkFBdH9GQnY4HshvvjCxC7b/DsT6Gj+QAeT
	PJI/FhKXqjGyuHDKv1Nb6Fh/kG4qJcnmalerKIl8+tBhrSfAWg1txldpp66D/e64FLleeYqqNMl
	i4eFS5ggqw5ZVGFxtm/AKQ5rDFGhCDSM9rjW3oSkpkAMEvSvADfv5IyjTdZQEIzI5y5QdCdHw4+
	eqI6ChS+8DgNktOPecP1rDWctSo7A5TwsCdjx/POmiIRiajt3AaHs9UZ+Fj30+Ik6tdDMnQFtKU
	9kbP1cvIZzxI0cbpkX0G6jhj/xKH2xx6K3EexPJoikObnFKm1s7osGbEBy+i/PPYwJNu4ZOt4Vs
	14k/DJhK4PyCeyonnRVIG3EAQEZRvU2p2/Y3Qi7RYYKdCgva895kBuZtTXc3wjppYJrFOwcVqvx
	yACmjb0/LEApLkD1bBVbQo8GOR/pyy/smS9WrKDz7ycDivs9nsLy29vDvdLWciv9zG6qPCTutAz
	O0cX9G/BxjMSQQ=
X-Received: by 2002:a5d:64e3:0:b0:451:b1a:a753 with SMTP id ffacd0b85a97d-45c5859ec65mr6550703f8f.6.1778690713447;
        Wed, 13 May 2026 09:45:13 -0700 (PDT)
Received: from localhost (p200300f65f47db04379dbd4376e53036.dip0.t-ipconnect.de. [2003:f6:5f47:db04:379d:bd43:76e5:3036])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45da0a19b1dsm64366f8f.17.2026.05.13.09.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:45:12 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	Igor Reznichenko <igor@reznichenko.net>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v1 1/2] hwmon: Drop unused i2c driver_data
Date: Wed, 13 May 2026 18:44:57 +0200
Message-ID:  <e8ceb3931975813545a8b478cc1a71b4ede9a6c0.1778688803.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778688802.git.u.kleine-koenig@baylibre.com>
References: <cover.1778688802.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2230; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=dCa1DfXDPSsUHmOxzw5wMgvkvgz4NFVsX8GQXxEU/ro=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqBKqK2JrtMsPHkQ3FNn3Uo1ltQVl1q2hHUQNrz II8cEzV+WaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagSqigAKCRCPgPtYfRL+ TkM0B/4pwa4LnAjN0sDkIQLM8vVo8xQkTgFegYhTDQ+jgwNtXrQvEAQUWX6tSkqeRamL8aK6mBB VmnBqmxqHGOQaRbsG9ht7Ds20xdJvLfoNXhj4lr7OdOuG8DkRW9IYOW0CylWm/w5BD8ZRXjGpxU U7MNIeogudoXezzssxdUsUIE/vW9muT9evaabqM//1e8Q5mZcJ0POz1GRbhFXeZN48kzOI6w9FY YpM9YMBlczfc+Z91H+iSb17KlCLfPdKy35A4xWYVotT9sl9lKlB6Jkm+s5RQDbt7nVoZwh/Y2u4 L9IG46pf0NkhPONh5rKMLvO2PxN0tB5NST5PjUJm/ufzQxvZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The four drivers all don't make use of the value that was explicitly
assigned to the .driver_data member. Drop the assignment.

While touching these lines also make the assignments use named
initializers and drop a comma after the end-of-list marker.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/hwmon/lm80.c          | 4 ++--
 drivers/hwmon/pmbus/aps-379.c | 4 ++--
 drivers/hwmon/pmbus/lt3074.c  | 4 ++--
 drivers/hwmon/tsc1641.c       | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/lm80.c b/drivers/hwmon/lm80.c
index 63c7831bd3e1..002c669182e1 100644
--- a/drivers/hwmon/lm80.c
+++ b/drivers/hwmon/lm80.c
@@ -622,8 +622,8 @@ static int lm80_probe(struct i2c_client *client)
  */
 
 static const struct i2c_device_id lm80_id[] = {
-	{ "lm80", 0 },
-	{ "lm96080", 1 },
+	{ "lm80" },
+	{ "lm96080" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm80_id);
diff --git a/drivers/hwmon/pmbus/aps-379.c b/drivers/hwmon/pmbus/aps-379.c
index 7d46cd647e20..3ec0940ae564 100644
--- a/drivers/hwmon/pmbus/aps-379.c
+++ b/drivers/hwmon/pmbus/aps-379.c
@@ -100,8 +100,8 @@ static struct pmbus_driver_info aps_379_info = {
 };
 
 static const struct i2c_device_id aps_379_id[] = {
-	{ "aps-379", 0 },
-	{},
+	{ .name = "aps-379" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aps_379_id);
 
diff --git a/drivers/hwmon/pmbus/lt3074.c b/drivers/hwmon/pmbus/lt3074.c
index 3704dbe7b54a..ed932ddb4f77 100644
--- a/drivers/hwmon/pmbus/lt3074.c
+++ b/drivers/hwmon/pmbus/lt3074.c
@@ -95,8 +95,8 @@ static int lt3074_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lt3074_id[] = {
-	{ "lt3074", 0 },
-	{}
+	{ .name = "lt3074" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lt3074_id);
 
diff --git a/drivers/hwmon/tsc1641.c b/drivers/hwmon/tsc1641.c
index 2b5d34bab146..fc53cd5bb6e0 100644
--- a/drivers/hwmon/tsc1641.c
+++ b/drivers/hwmon/tsc1641.c
@@ -721,7 +721,7 @@ static int tsc1641_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tsc1641_id[] = {
-	{ "tsc1641", 0 },
+	{ .name = "tsc1641" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tsc1641_id);
-- 
2.47.3

