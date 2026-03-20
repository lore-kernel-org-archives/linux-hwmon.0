Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129F119ABD8
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 04:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773981277; cv=none; b=eYlfa/DJk+WixeHkJd/BMpk+pRGX/APNhUkH+Ap070dDGPktIhn2PfFjdOJBA05ovG/ZiJwIFRn+a49CDEodP3apEjmQAUCRLK99hv1bYksonjkmsRAFJvfvk5e1OON9dJWcFaJE0SJN+kqTp2MqITmPrbF7vpJUp0MfQUWXyuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773981277; c=relaxed/simple;
	bh=If+OOSlwyOvv1b0S/m+3KEFltvR4HdxwbsuXlJ+npng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MhKcu8u8pg7umPYB0iSXapXYThentj70mvkC8JJlCCgC96GZk5se6gdPlaN+WruwaG69q3W7YeHG18XEetsk+cVGlvYzVhvwCx0XJYrDDn6ontRAjnZqrYBpOTyEc3GMF00xb2kKslbpeVymr8tfeSWsRt/gdBgxxq4M2yi1rtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iG8JHb1U; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iG8JHb1U"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82418b0178cso878184b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 21:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773981275; x=1774586075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=XyhGFkWAx1cSgateLA5KMFRcu6nfa/0k80KoVTr1Ap4=;
        b=iG8JHb1U/jULMEp46IFKkOcj/WCl++bm4AdEgsnzUA4E3wLxOgRMbze/rLYXX2v8XN
         u1JCai0AzfQreegRKXG/o9DYqY8bQabPzbl//5VyoMK3vEpUJIBDCZ4iihIXvkxNauj9
         EiJU7zIKn1pAV8efdf9j79MT+Or20BzqIzOvecrw/PoDAebxxU1Gz5AZhN1yDFhB0uEW
         cRaFcyeXznNNHf/U7wGTZXUl+iveR3lK18hokbs0DY5l1dza8IbNna750cXvdAouq+cL
         O5PFXn/BnK1pw9ngch/Tevuf5EJ5ferUGHiEIP9Aso9O+mRECqtYj+5wf9AfVh4HjTge
         RIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773981275; x=1774586075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyhGFkWAx1cSgateLA5KMFRcu6nfa/0k80KoVTr1Ap4=;
        b=oJmoMPD5SC13rH9+t7dvgTeYlClc2hDHlc9rDweZd21JPAEMomVrF+E9pTJdUcprnV
         YBstCFcP+d40whEXsKh32iwsUb3JyOXBwrsmBxctzR8kLGIi8P7w7dIvcSNlVTvzyWHk
         dPw5iZt7FqC7yVX1cZ/XzIuNA+ola+BDB/wUcsUqPOqg8Z2lDjnTPhrfrQ5vEPQZvkZs
         yICXRQPK1sc6Jkk2OddESX5iJzmgS7MYENY/ew2c/ptkd2TB14//cdqUM9WjlbytPRjk
         Zmj6qk+aF8rH57wt9T1+wsa65YRXYVZKccdQHqMqXzKabEIPkTf8P+ZM4WszNdrqCAm/
         hEWA==
X-Gm-Message-State: AOJu0Yy8JMyiL10gxJVZnPMUUMamhTtQ4N4941fIq5KQcZTOS/pyU4eK
	xneSWDW4XITmLJb35GSez9vrVQUzgstn531AmEt9zPiEZuLKt0iHggcQc8y8PQ==
X-Gm-Gg: ATEYQzw1ZAlqsvvfGDe0fPWT2IqL13UKXP28++czjlHIniheSyBt38zHuNNlohAzquu
	v1I2v+VvY2PQfMAEWGqhDcFNgpBqAGq6TbYoeAz4T2rBpTVsi/v87tcUa0QFcPIHXpqQh7SGwDw
	VMGIzqEir5ic1V2UA/ZDeXOvGIneWPa3qoChygZuQZ5Z2a5NTdvaUSOi4v6/RE5V6eXrC4KjlyX
	4weLFia/cu3WOME9dNQRrz5IAiTxVx2FAPAgax0sgI+tv4henoh74Mc9gQUy6ueLFxYnBVh0dpU
	bZuXK1JRl9M8Tku2pSMCRnLh+B5VbV18Pvroy7o6ZUDbU8iaXIQd235L5zxOWfToWa5PEv96MpU
	5FLcXHNTe4hSTfuUB9UXB0HFJ8sUIVR33OPpZiriBy/kfBLnb7gWWWgmWewkt7qhIbWecDhVK0L
	Fsn2aZeTbyzjcngVTi68O+UOwqatiMvSvovwwW
X-Received: by 2002:a05:6a21:6da6:b0:398:a659:eb0 with SMTP id adf61e73a8af0-39bcec0ba80mr1508785637.34.1773981275143;
        Thu, 19 Mar 2026 21:34:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74487b5b8csm722513a12.31.2026.03.19.21.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 21:34:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Naresh Solanki <naresh.solanki@9elements.com>
Subject: [PATCH] 7506ebcd662b hwmon: (max6639) Fix range of pulses-per-revolution
Date: Thu, 19 Mar 2026 21:34:33 -0700
Message-ID: <20260320043433.243289-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The valid range for the pulses-per-revolution devicetree property is
1..4. The current code checks for a range of 1..5. Fix it.

Fixes: 7506ebcd662b ("hwmon: (max6639) : Configure based on DT property")
Cc: Naresh Solanki <naresh.solanki@9elements.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6639.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
index 9a3c515efe2e..1e0550e27626 100644
--- a/drivers/hwmon/max6639.c
+++ b/drivers/hwmon/max6639.c
@@ -540,7 +540,7 @@ static int max6639_probe_child_from_dt(struct i2c_client *client,
 
 	err = of_property_read_u32(child, "pulses-per-revolution", &val);
 	if (!err) {
-		if (val < 1 || val > 5) {
+		if (val < 1 || val > 4) {
 			dev_err(dev, "invalid pulses-per-revolution %d of %pOFn\n", val, child);
 			return -EINVAL;
 		}
-- 
2.45.2

