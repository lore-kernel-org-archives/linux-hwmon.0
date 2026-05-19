Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362E92D47FF
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 00:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151960; cv=none; b=fkiBfF5FeYGpWQ8OX6iqlIl+aOcN4fVvOH+iigsxlikdfen8Qs0T57BMYTmcw8za8rRfgGDxWvn6xQYibUUTJYgMX4GyZQbYVUg92lYeSGyae9QFvhXkpwaB5/+iCa+ZzRzGFu2Dcflak89Hu6gBOyIXOnb59xQcCXU0tEicxuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151960; c=relaxed/simple;
	bh=MbcEhPfilDl5djs8OwiISgXUAGJH031p6hDtDP0Q1lw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LtT7RGUcrsb1yisU0erxBc9B7WHniz8AeUaEhEOEabSWsctbS+TAXZfwGN7vAd0UoRKg0vufEa4lvVQi8RHVPuds9YlL5d9EASNy4AqlAZCVQNuU2H9wE/SPHKvsc8M30bv///6Bx1e3ZswTXoM/KUjnXf0CjDNKBaZktxEqniQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=HLBhpNFK; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="HLBhpNFK"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-134ac81c445so10801944c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 17:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779151957; x=1779756757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWewpsuFbzTqoRaVPbiB62v6E+GOY+1kwxAn2d+qoXs=;
        b=HLBhpNFKhHmcW89rtStr/gT2BTY9pEKaCzvShRGGfeaTMbrtbKv83n4BKV+OIJcfV+
         nDheqI9UjvqzcntyDsPWPkMNj2k8BEVVV9MPP1+cXrXUfjnmJPTjsL08fH/uzmLu5fxJ
         mAJxqRHqbABchNgCc32T/1/v8XgNzpL8U9fVVWwJWl7wye6fVgVdvCJBuGvPR/2Wu7/V
         GhHSr1SRrn4geRzsniihVyEOItBFmMG/V7ZgX3vDbgrlocMvnpSnt6v/hKhU6idYDfCI
         Qxb+NpSGkKhZnkmfRrlnQ/8OoFlI2jpCe3z7VuGLV2PKqWWmHfdOPWmQrfr27SmJK9PD
         2KTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151957; x=1779756757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jWewpsuFbzTqoRaVPbiB62v6E+GOY+1kwxAn2d+qoXs=;
        b=oKRGk+3S7Mr+rJRPeu0jBPyo0/9tQegqHbTAmoUIG2EGDJBKTrIDE7LU6XFExTOk+5
         oJniAn5PL6VmLrvjXYqUtTSButmHZUQThyuzIztZRy4811s6GHfPcB0ozsf2c6vpasr1
         o924A3OdliU+QdxEELfAVZK+dtXxpdSCs47nIk9wQ3n+PaRhP+ucavF/E5J+MRpcb2Vn
         dXNSzegnPL8T1sR2HomR6np5A3/vRGS9k4PiVJ0vRZS7fssSX8V/j/UsNqAv+4hlePfx
         5aVaJrwbKcihvUxLmOuG+0lentkpnQMcX1NNk5Rk+giUGXaKicjHdUbM9C+0XPRAXAeG
         m+cw==
X-Gm-Message-State: AOJu0YydUF9SsJq8tZjHbHXUyea8HtALOnjtapGBVeP8865oEuXt/qHK
	zBNd/Bs85zAV+eojexotSzlPe1nRmPdb5mlzOXgWYghK4hhnGNrhEGcLZ8ZSpdp/jbk=
X-Gm-Gg: Acq92OG3Smo0eIb538KCkNRu03pDz7RHndlKkkd1vnmG9GY0KTlEci07wp8ty3OiROD
	9IoF4THWlQwvsThlIU9YxwsrgKXX4BnN+ghiKKeMBhPBpxivWSI+hBY/0ntgQjTZ03xAqdJkRJK
	QqrzYM84C79fc6pa4nw7djZZKH8M2lvL6nXsL9/TK1308G6bvAENo3cVhVVRojZophbTQqsFhLm
	+D1xt5Jb28FPCRSQMiQht81BtkD55KX75YJbUG7Ef/x9GdykmBKOqxRKhJlo5RhtmUKQ+tIKgW7
	rbqix6pUw+8pxefYcz7IqMBEMqbp74blS+zvqlyZA7+9JIWNyEJmGalZGJIYwsSsuk8D427oTZl
	1Wn+4uiQgP+76sD1W1ft7tu9h3OCVI/W8srpQOnh5zdoXaIdMnve4wbdB+5iFGoWEnhefjV3Reh
	1zeIKB1Fr8TRzZH3yB5pparR1ooA==
X-Received: by 2002:a05:7022:2201:b0:128:bae0:e03c with SMTP id a92af1059eb24-13504948b9cmr7313101c88.30.1779151956831;
        Mon, 18 May 2026 17:52:36 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm22546633c88.3.2026.05.18.17.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:52:36 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 18 May 2026 17:52:32 -0700
Subject: [PATCH v3 8/8] hwmon: (pmbus/adm1266) serialize sequencer_state
 debugfs read with pmbus_lock
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-adm1266-gpio-fixes-v3-8-e425e4f88139@nexthop.ai>
References: <20260518-adm1266-gpio-fixes-v3-0-e425e4f88139@nexthop.ai>
In-Reply-To: <20260518-adm1266-gpio-fixes-v3-0-e425e4f88139@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779151949; l=1513;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=MbcEhPfilDl5djs8OwiISgXUAGJH031p6hDtDP0Q1lw=;
 b=tZbataWxursToK6TwLtzAmcuF1Y17nbY6u7cTpaJYyj/zzPSkodk7mxZZH1JHVU1DnAEfVJlV
 wM8DBAZHWeaDlPp97HVGOW3fr13+66tWHGwfFTqkXPbMbpgV5W2XWyX
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

adm1266_state_read() backs the sequencer_state debugfs entry and
issues an i2c_smbus_read_word_data(client, ADM1266_READ_STATE)
against the device without taking pmbus_lock.  pmbus_core holds
pmbus_lock around its own multi-transaction sequences (notably the
"set PAGE, then read paged register" pattern used by hwmon
attributes), so an unlocked debugfs reader can land between a PAGE
write and the subsequent paged read in another thread.  READ_STATE
itself is not paged, so it cannot corrupt PAGE in flight, but the
same defensive serialisation that applies to the GPIO accessors
applies here: any direct device access from outside pmbus_core
should be ordered with respect to pmbus_core's own.

Take pmbus_lock at the top of adm1266_state_read() via the
scope-based guard().

Fixes: ed1ff457e187 ("hwmon: (pmbus/adm1266) add debugfs for states")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 051f4f188ec5..605db086236c 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -333,6 +333,7 @@ static int adm1266_state_read(struct seq_file *s, void *pdata)
 	struct i2c_client *client = to_i2c_client(dev);
 	int ret;
 
+	guard(pmbus_lock)(client);
 	ret = i2c_smbus_read_word_data(client, ADM1266_READ_STATE);
 	if (ret < 0)
 		return ret;

-- 
2.53.0

