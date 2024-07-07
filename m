Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE96249F5
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Jul 2024 14:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720363659; cv=none; b=MnU1B71DcSQk06WoPNvpiVvp4fb6uwNz/AgS0gCIU4Fw7wXUxboZHEkT2DRNal7TX5fN3W4KY5OrI766r14TfCSfX0aa5jxbH43KeDq7LrHixPGTRHekng92oUAFNALg3ww3clMw6P/S4qQK+XRohuWjwqq+0kYOON5JUcWiLSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720363659; c=relaxed/simple;
	bh=sEKymSb4V/5UYTKjqzpjucrImJfVPbU3d34MPskmtrE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=erFd0CkoFIyC5Gk/AtBltvOc3ZwKUDy0G4+rhFncpL9lSX67aW9WEVzfRaA6hYEWj1ZtGGdEGpPi5noJbyWQnC5dYj/dayUMsTN8eT4Z3R7s5Nj9MXmCBPBxcGCK3ykxrO2SxZdB1O0aJ1xf8/NZeTsP8df0vtJsB4oHKajAe/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVUFqE2y; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVUFqE2y"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70b1207bc22so1584622b3a.3
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jul 2024 07:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720363656; x=1720968456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yj5zwIeOXsJDHCwI9wKdf0EHHrasLmnN/fRah16z5oc=;
        b=mVUFqE2ykh6PAB7sR7fIZoIWvzFCTiZGJSGqdKvg98Pb4WSQHIa7RAOBHJ1t5KqoKr
         IA3Iy147jOrvvAS9UZ/y9ZDO4jZyrSnanbcSGPsXWilyYe+Dibo50EYKo8G4SAYDQ0hX
         vpKXTQlXHp78G7DLPqKXrvaAzzH88shAI4NhbFj4pODTaO18lBgYhohPp9FCtWYi8lUy
         WIC7zaY+a+mz1eR8oD7TR6Ofb9Tf2YhmOUFHNBU5svL6IdoNXmQ8tuF/ClOSV43jPJkm
         AyCLtHPdXZ8Kz6CnDdb2CZWenzUdWQTmzxPTlA9tUhUXr1ayBJW4+0EYtCWANGrja5gw
         Q3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720363656; x=1720968456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yj5zwIeOXsJDHCwI9wKdf0EHHrasLmnN/fRah16z5oc=;
        b=L8fNx4yPJ5tiUTOp9XHUD7+R7qrcEBT+6NmnnTGuyjjhKKIJM69EdLdgDsHSXgbfpN
         bYjqwvH860EkzVtlQRu5aRQi5KM50d5cam+kXE6MqSVTOXi42V84TVnayfHPMUs5/Y1M
         bOvRR33nJVu36lICwP+jzQRzpRiqN5kQ70/0kwzhWCi6DMEP0o3MI3uqxzlIy3MmSyVt
         KF4rrhlmTEciBHfk7JJL1B33HMKxI2gR+z9okvFp1nD1vLJ5wRYVlL2RC9JIPQh8p7J9
         IfX6iL6I7XfmaKASIptUMyCOl7v+fi6QTHlxpWDmpzWz8tQXGr/b/TTWy4Kh1Zqwp5VZ
         mPQg==
X-Gm-Message-State: AOJu0Ywh+Q6hlL+XPOJSlY+rq4sXVIoUCALbklryTfFChq8dskiEU95y
	FeefP7coUcblOv3iZcW699W3dM9/uWcsItyCk+Rn3JeXZ5v3HD6jdxQsgQ==
X-Google-Smtp-Source: AGHT+IH7YAcy2rZ3nNEFgDoISXTd51/iVhxW/8ap8U7lZqMx4gD3dLtwKD38MjdqXiCIRkfQ/jCsAQ==
X-Received: by 2002:a05:6a00:4b55:b0:705:97b3:4605 with SMTP id d2e1a72fcca58-70b00c0abb9mr10749882b3a.25.1720363655888;
        Sun, 07 Jul 2024 07:47:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b202d78c7sm2482439b3a.217.2024.07.07.07.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jul 2024 07:47:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/4] hwmon: Fix underflows seen when writing limit attributes
Date: Sun,  7 Jul 2024 07:47:26 -0700
Message-Id: <20240707144730.1490208-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DIV_ROUND_CLOSEST() after kstrtol() results in an underflow if a large
negative number such as -9223372036854775808 is provided by the user.
Fix it by reordering clamp_val() and DIV_ROUND_CLOSEST() operations.

The problem was fixed using the following a coccinelle script. The python
arithmetic is used to fold constant multiplications.

@lc@
expression range, val, err, buf, res;
position p;
expression divisor, l1, l2;
@@
	err = \( kstrtol \| kstrtoint \| kstrtos64 \)(buf, range, &val);
	... when != val
	res = clamp_val(DIV_ROUND_CLOSEST@p(val, divisor), l1, l2);

@script:python mult@
l1 << lc.l1;
l2 << lc.l2;
d << lc.divisor;
m1;
m2;
de;
l1e;
l2e;
@@

coccinelle.dn = d.isnumeric()
coccinelle.l1e = l1.replace(' ', '')
coccinelle.l2e = l2.replace(' ', '')
coccinelle.l1n = l1.isnumeric() or (coccinelle.l1e[0] == '-' and coccinelle.l1e[1:].isnumeric())
coccinelle.l2n = l2.isnumeric() or (coccinelle.l2e[0] == '-' and coccinelle.l2e[1:].isnumeric())

if coccinelle.dn and coccinelle.l1n and coccinelle.l2n:
    coccinelle.m1 = str(eval(l1) * int(d))
    coccinelle.m2 = str(eval(l2) * int(d))
elif coccinelle.dn and coccinelle.l1n:
    coccinelle.m1 = str(eval(l1) * int(d))
    coccinelle.m2 = l2 + ' * ' + d
elif coccinelle.dn and coccinelle.l2n:
    coccinelle.m1 = l1 + ' * ' + d
    coccinelle.m2 = str(eval(l2) * int(d))
else:
    coccinelle.m1 = l1 + ' * ' + d
    coccinelle.m2 = l2 + ' * ' + d

@@
identifier mult.m1, mult.m2;
position lc.p;
expression res, val;
expression divisor, l1, l2;
@@
- res = clamp_val(DIV_ROUND_CLOSEST@p(val, divisor), l1, l2);
+ res = DIV_ROUND_CLOSEST(clamp_val(val, m1, m2), divisor);

----------------------------------------------------------------
Guenter Roeck (4):
      hwmon: (adc128d818) Fix underflows seen when writing limit attributes
      hwmon: (lm95234) Fix underflows seen when writing limit attributes
      hwmon: (nct6775-core) Fix underflows seen when writing limit attributes
      hwmon: (w83627ehf) Fix underflows seen when writing limit attributes

 drivers/hwmon/adc128d818.c   | 4 ++--
 drivers/hwmon/lm95234.c      | 9 +++++----
 drivers/hwmon/nct6775-core.c | 2 +-
 drivers/hwmon/w83627ehf.c    | 4 ++--
 4 files changed, 10 insertions(+), 9 deletions(-)
