Received: from out203-205-221-209.mail.qq.com (out203-205-221-209.mail.qq.com [203.205.221.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1153D3D11;
	Wed, 27 May 2026 08:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869592; cv=none; b=orMJovzOjUYgMHT6v5YHlpNOMFXYDcqK7LImnsOM14pY03oPn37pwPlXs8F15cJ6V6toax7QkeIVEVkFUyixBq7vQ1HDy6Vhd5eN7FpHj5X1HnprkaU9iZY9LL9GkP3MQo1yLCmXiUvIFdz4eL9zf34nAvmjz5WHlsGp5ki4W6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869592; c=relaxed/simple;
	bh=/Rm5g60pGTkDhMLaSW54NcYzkEqxzc+u89afTyG4kIs=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=q+Fa0aoKG2cKf2sRH19dG9k7nyfocQ1nvY2TKtmH4wkpF+Yszwin0YW6DmOGykRwkz/wQy4aacpPESO1KEjLRGANKm+qxCeUyCALdYonu9SslQ8X03Z+fEv+L457YT3tslPnY4SVKu9cPXvt4VsF/BDPBKKZgLnYEvEZoqwARHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=m1pzyvJU; arc=none smtp.client-ip=203.205.221.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="m1pzyvJU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1779869581;
	bh=+hgixKQujfC9rsVTqvw9qKV3Fm/cWcZloWaIy4iCvNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m1pzyvJUSz2ZJdoz6L36ObPUa+g/PGOiA3XTiRF8gnvVtkavIAdUuvq9/MyxUudsf
	 G9DkYvRU6nSdISGyRZgAdwZVm65KuMyfsmOKQUwH6zZPJYfeDLyo/CjDKJt1HmdjZ8
	 goIWwlmZ4MYZLFKsCs9knzRA7Swuix6J4mFgwOKI=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 339BD2B7; Wed, 27 May 2026 16:12:57 +0800
X-QQ-mid: xmsmtpt1779869579t2y39a0mi
Message-ID: <tencent_C95D6F2268B839A84420E7BD664E32E61C09@qq.com>
X-QQ-XMAILINFO: NOGjjKUrN7vhgTPyIQr6E9Rx8v0pXEanM22WkkSKU9dwg+pEhvLaFFACPb9YTW
	 XDvfxUtxTd50HM8sHcf9AcFW6aytv2GROZka49WYUXBynVBSuIGLbZ0w4Jcae9jDGf7+rfAtzJ9s
	 4usdtk5nI/jewTFqUM0qr7kcE5AwOfMkg+CqcGti+8wL/2ys3Kuh+cKbvCq2Qo9xof2OqvQnJBMY
	 obdgod1+E9dC6NwLZuJXrYVdNs9PBv9sAw4pCxEcBXOdHXEdckYyt0TfkY+kifKKVSveq1Bp35Ug
	 uf83k+AuDMSfKLzzZnDXGUsd6rB80WDvmabObPCPkfUSkoFDVxDVw2ZHIyB08zso796Z7GNLf4Ai
	 IsqhKrURgkS0oQMr3IByZ5Z1r0zYjPvQJ3mpdkV58tG4KLrMYmavZGDYeWV0FMMvPRl+cguRDjBq
	 HL6rCvhpSA6F33FiB7DM1kN6KP9/RbvkjWXwrE2u4Gxibiib8LsIts7r/hPLT0mkBl2eSfb45RPp
	 i3q1R/+5OvIySLT+o3dFHz3K2aVOyBdQ2FsWUU+Zn/LcU4T/lTqM4JzgajjdMEtMf9lO1X3sIN3R
	 nwqkQ0JiiLa8Kpr+nrJFUfj337uT/p6CyVny2AsuonMVOkgBDXnqrzMs+nNZAc8wWyKOHAhPjTTE
	 PDvcNCXg0VWLKuy3aj5NamXCLzL1eCT/zhdMXN9ZL1N6qrth66f3yJTjBIfCpPsr854WzvyyKis6
	 pV2VZtKDMBuHUvKE8g7XIXYqzXEesKZtX9IWSV6k1A8zFZzO+DYtXHZupCptxhqCn3Kse4f4S3I3
	 l3ySZJgWocaBRhJjf6CovMqTb5+IENGin6+lPaTZ3eUMmAt9ewqWek+vv5Fc9FKswWRtTcPzS6oZ
	 q9Hbjr/ATtS0xqqVu2DevbMaHONbBxMttvAnYXaDLXXN+o6cjvtXNslX/5JBDjiYjlAdmbIWtaGW
	 rYxE7m/uP3oQTHLe+dxL15d45+W4dMxVyO+9ipiaOk4F/SPQlG41Vdk89s4PHtjHKaRGZf06OZ00
	 uPsCXa7rGH8fk1XT6WWIFg8PQHU42TBArXTidEpg==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: xiaopeitux@foxmail.com
To: cryolitia@uniontech.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v2 2/3] hwmon: (gpd-fan): Initialize EC before registering hwmon device
Date: Wed, 27 May 2026 16:10:55 +0800
X-OQ-MSGID: <425b71ece3cbe9a940cbe30039a6c428ee2210b4.1779868768.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1779868768.git.xiaopei01@kylinos.cn>
References: <cover.1779868768.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

Move the gpd_init_ec() call to before devm_hwmon_device_register_with_info
in the probe function. With the previous ordering the hwmon device was
registered and exposed to userspace before the EC initialization
completes, creating a window where sysfs reads could return invalid values.

Some buggy firmware won't initialize EC properly on boot. Before its
initialization, reading RPM will always return 0, and writing PWM will have
no effect. So move gpd_init_ec to before hwmon device register.

Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/hwmon/gpd-fan.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index 7284babd4f5c..745b3fb9e3a4 100644
--- a/drivers/hwmon/gpd-fan.c
+++ b/drivers/hwmon/gpd-fan.c
@@ -643,6 +643,7 @@ static int gpd_fan_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, data);
 
+	gpd_init_ec(data);
 	hwdev = devm_hwmon_device_register_with_info(dev,
 						     DRIVER_NAME,
 						     data,
@@ -651,9 +652,6 @@ static int gpd_fan_probe(struct platform_device *pdev)
 	if (IS_ERR(hwdev))
 		return dev_err_probe(dev, PTR_ERR(hwdev),
 				     "Failed to register hwmon device\n");
-
-	gpd_init_ec(data);
-
 	return 0;
 }
 
-- 
2.25.1

