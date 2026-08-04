Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A971477994
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 16:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785861289; cv=none; b=jGEOfvAava+sC9S3f0xAiRHkOPyJXqy6SpUJiRF9odgU31pBGG72uZytCnKx7j555FRy8mjBYxPzKUG/qnVTJ6OPBkfBRFPTXwRKN32Tk8bItxFclqepjb51si9MBjQ4gegrNvBh11dwM6ufbB6zkRqYRb8qnjR09YMG9VHKmwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785861289; c=relaxed/simple;
	bh=pyIMj0iBihV6PTPjbJZ14WgYbw8OeizE5Dsp3ZuWL0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEM44brHPaufo1orSGMkNziLEtuRaeHJy1Of04IS01emssHtBj+/4Rh/FeL4rQQqTqXIwU1DZECJ6GWNmWXbtMdVmb4DC3WZW1x63hunpz36jQ0FqLIlSigRPjnaps0kdgfCEq5u7oDa94vExhg2LZpXQbtdFwzPIuvzF4a/j5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZts7X0R; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZts7X0R"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2caced6038eso1420955ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Aug 2026 09:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785861280; x=1786466080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/t6tgjAf5ln0cWY41aGVkzi3qJWXNqseaffOZElwunw=;
        b=GZts7X0R4OT1pUUjk5ecLnEQyIdOcJbwJ+7lI3k1cwtn0Fkj+DiDraTx9HlrJlLi2v
         /UJygYHAth3pNFI09c+dos9htzUxmi9JuPnKVnxIol2WvCHioRYaOdbvqy6Vcq6D0dxE
         csvlfPKpXYfJM5l8lazNUJ0V4nNiXdjyCppFXsvdkGoY5OFUZKb4g5mM1H8yD6V7/UFu
         XrGu65fDa7LNHsg87t+p+jOGSroAlpjuTBTkhqo3X8AgCxFEZsKDaU7g7wafM1ajGZdV
         spQD1rcjaZ/4E7MpEkT/x0rXN+AQfu2/Gi97k0MOvVJbg8nmxyYs0Rz+g7ZwMd34RU9p
         vRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785861280; x=1786466080;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/t6tgjAf5ln0cWY41aGVkzi3qJWXNqseaffOZElwunw=;
        b=eO03fomUG/hM+fN9sNEfiLdjUgq4fWy7RAhx75ChypNZXvCiEI0x0iC4EvPQ93vBrK
         nGf7meVWxitQAUIfhUwJxU7dJoiOAPeDXaSwCLa3myv7N4/KNfFZXiiXcpiaYPS5tpqg
         LH7HM4e0Gt7ZY6jSjU4DCQ0OvurEs/b5e/rEG6xZnqp4TF5xmcCImPIjNbRwq/C653Qu
         xhwdaiT7JSo4jWVl7gAe0TD0LTzyK3lUtcQ4P4HQ1KufCYc7/BEk/WavKHesL8njAMll
         vGhWF2hsPsEmOiFU0Y9Q1rxs7njfR8YXmo0688kSHk/+P32RSe2l97C4tPI4jgEhazwP
         TBYg==
X-Forwarded-Encrypted: i=1; AHgh+Rpt2ZmSXlLrBi67ZY2x526qNrjwRHX8HP83U31ZZejPLAs874TZsK6uwa5EYQqS4O8RVm/C8rPL1tsdHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyet0lFAk5z2l/Y7q0Ne1Hgm64xUaIi0EwkvAYsfbQpNrFUOZuX
	UZlieMDzFiq73/EvZBEToc9BSXTbAcDOuqA1Mtkl/z+Hdvk2tTYvtcLG5b6yFA==
X-Gm-Gg: AR+sD10yXyoq0AwnYPThiroBad/L7VlOhqrwbO/77GpgKAyZIK2DjGkK9Hiwf6KmDZ3
	ofAhVsGUtF9PzoQaZwlMC9NX8M1YOzxuIsThw4xiO1OBueKH8nqq5MC+H6drXg+CKrz8ZBGppmY
	/yZwTiSi9B0sZ+6Z3cujPNYTQaFtkIulyfGN4H2s+pjiz7mWK3GjTBCQR08NRKP9ILZlFGsoNwL
	91SBEpdtmuzNb1Z/x86NeUX1Dv4CQZN72Jytov+pTIsVSP/OmOUxOrBGdEgys0CokAHAXaeL4l4
	pmomYQhCJ2mjp72whxFqpc/rP1LzIXZ/tj8C/Y5lzEFi/tVn/hrb1OC+EkcU/25o97AHVX/4sIj
	Y+jHAFPlayncwSM4kz017PEagDPBnZTa6zB5fm62uaco/x6h/YYV/Db/GkQLbgh4TyTyrHe3jdH
	3qyQZNCL16iREfRhOGSrOEe4OuBAqxe2a8d6kxjV5uj0/Uy+RS+uSGL6xiZfOliHfPcjr/GqNIb
	9Tk6BbWG6Gx
X-Received: by 2002:a17:902:e849:b0:2cc:10c1:352e with SMTP id d9443c01a7336-2d08ab8bacamr42825455ad.21.1785861279930;
        Tue, 04 Aug 2026 09:34:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa013dafsm10460345ad.35.2026.08.04.09.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 09:34:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 4 Aug 2026 09:34:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Ali Ahmet Memis <ali@iusegentoo.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) serialize debugfs access against
 hwmon
Message-ID: <0a50dbe2-4df8-4952-8090-cd97ece2a6c9@roeck-us.net>
References: <20260802123653.19532-1-ali@iusegentoo.com>
 <20260802145745.6f444fc2@posteo.net>
 <85f8ccd7-0d2a-43db-8690-cf220bd76e32@roeck-us.net>
 <20260804001347.164873-1-ali@iusegentoo.com>
 <ec30f5bb-48bc-485a-a7a6-953af65a66f5@roeck-us.net>
 <20260804061110.575adfc2@posteo.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804061110.575adfc2@posteo.net>

On Tue, Aug 04, 2026 at 04:11:11AM +0000, Wilken Gottwalt wrote:
> > 
> > Gemini tells me that fixing the raw event problem will require a spinlock to
> > protect the completion and a separate receive buffer. No idea if it is correct,
> > but other drivers do the same, so it may have a point. Either case, this is a
> > bit too much to do without hardware to test, and I'd rather prefer to leave this
> > up to Wilken.
> 
> I was working at that one, too, because I saw Claude Opus hinting on that one.
> But it drove me crazy, because every AI is saying something slighty different. I
> can not really pin down which one is actually the real solution. I tried to read
> through the subsystems code and other drivers, but, argh, I don't know. I was
> playing with the idea to (1) remove the raw HID mode completely or (2) make the
> driver switchable, raw HID or normal HID, but not both at the same time. On the
> other hand, in my Github repo where I develop the driver, I also have a tool
> which demonstrates how to access the PSU completely in userspace via libhidpi.
> There is actually no need to provide the raw HID access.
> 

Have a look at the patch below. It is part AI (Gemini) generated and part me.
Sashiko is happy with it, but of course that doesn't mean it is perfect or
even correct. It does look good to me, though.

Making Sashiko happy required all core elements of the patch:
- the spinlock
- the separate receive buffer
- the rcv_pending boolean
- the size check in corsairpsu_raw_event()

Sashiko reports race conditions if I drop just one of those elements.

Guenter

---
From 50fae138603a9a6b1929cbe9a644310495688eea Mon Sep 17 00:00:00 2001
From: Guenter Roeck <groeck@google.com>
Date: Mon, 3 Aug 2026 17:39:21 -0700
Subject: [PATCH] hwmon: (corsair-psu) Separate request/response buffers and
 validate reply echo

In corsairpsu_usb_cmd(), a single shared buffer (priv->cmd_buffer) is used
both for transmitting command reports via hid_hw_output_report() and for
receiving device responses in corsairpsu_raw_event().

If a command sent via corsairpsu_usb_cmd() times out, the caller stops
waiting, but the hardware may still process the command and send a delayed
response later. If a subsequent command is being prepared or transmitted
when this delayed response arrives, corsairpsu_raw_event() blindly copies
the incoming report into priv->cmd_buffer and completes wait_completion:

corsairpsu_raw_event()
    if (completion_done(&priv->wait_completion))
        return 0;

    memcpy(priv->cmd_buffer, data, min(CMD_BUFFER_SIZE, size));
    complete(&priv->wait_completion);

This causes a data race where priv->cmd_buffer can be overwritten with
the old delayed response while hid_hw_output_report() is transmitting the
new command, potentially causing the PSU to receive invalid parameters or
shut down. In addition, the caller of the subsequent command will wake up
early and either consume stale data or fail unexpectedly.

Fix the problem by:
- Allocating a separate response buffer (priv->res_buffer) so that
  corsairpsu_raw_event() never modifies priv->cmd_buffer during outgoing
  transfers.
- Validating incoming reports in corsairpsu_raw_event() to ensure that the
  echoed length and command opcode match the pending command in
  priv->cmd_buffer (or indicate an unsupported command opcode with 0).
- Protecting buffer initialization, reinit_completion(), and report
  validation/completion with a spinlock (wait_completion_lock).
- Adding a boolean flag indicating that the code is waiting for a response,
  and only copying the reply into the receive buffer if that is the case.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Guenter Roeck <groeck@google.com>
---
 drivers/hwmon/corsair-psu.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index 5592b927e9d4..3eebf8494ed8 100644
--- a/drivers/hwmon/corsair-psu.c
+++ b/drivers/hwmon/corsair-psu.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 
 /*
@@ -122,7 +123,10 @@ struct corsairpsu_data {
 	struct device *hwmon_dev;
 	struct dentry *debugfs;
 	struct completion wait_completion;
+	spinlock_t completion_lock;	/* locks wait_completion, cmd_buffer, and res_buffer */
 	u8 *cmd_buffer;
+	u8 *res_buffer;
+	bool rcv_pending;
 	char vendor[REPLY_SIZE];
 	char product[REPLY_SIZE];
 	long temp_crit[TEMP_COUNT];
@@ -158,15 +162,19 @@ static int corsairpsu_dutycycle_to_pwm(const long dutycycle)
 
 static int corsairpsu_usb_cmd(struct corsairpsu_data *priv, u8 p0, u8 p1, u8 p2, void *data)
 {
+	unsigned long flags;
 	unsigned long time;
 	int ret;
 
+	spin_lock_irqsave(&priv->completion_lock, flags);
 	memset(priv->cmd_buffer, 0, CMD_BUFFER_SIZE);
+	memset(priv->res_buffer, 0, CMD_BUFFER_SIZE);
 	priv->cmd_buffer[0] = p0;
 	priv->cmd_buffer[1] = p1;
 	priv->cmd_buffer[2] = p2;
-
 	reinit_completion(&priv->wait_completion);
+	priv->rcv_pending = true;
+	spin_unlock_irqrestore(&priv->completion_lock, flags);
 
 	ret = hid_hw_output_report(priv->hdev, priv->cmd_buffer, CMD_BUFFER_SIZE);
 	if (ret < 0)
@@ -182,11 +190,11 @@ static int corsairpsu_usb_cmd(struct corsairpsu_data *priv, u8 p0, u8 p1, u8 p2,
 	 * was send, not every command is supported on every device class, if a command is not
 	 * supported, the length value in the reply is okay, but the command value is set to 0
 	 */
-	if (p0 != priv->cmd_buffer[0] || p1 != priv->cmd_buffer[1])
+	if (p0 != priv->res_buffer[0] || p1 != priv->res_buffer[1])
 		return -EOPNOTSUPP;
 
 	if (data)
-		memcpy(data, priv->cmd_buffer + 2, REPLY_SIZE);
+		memcpy(data, priv->res_buffer + 2, REPLY_SIZE);
 
 	return 0;
 }
@@ -781,6 +789,10 @@ static int corsairpsu_probe(struct hid_device *hdev, const struct hid_device_id
 	if (!priv->cmd_buffer)
 		return -ENOMEM;
 
+	priv->res_buffer = devm_kmalloc(&hdev->dev, CMD_BUFFER_SIZE, GFP_KERNEL);
+	if (!priv->res_buffer)
+		return -ENOMEM;
+
 	ret = hid_parse(hdev);
 	if (ret)
 		return ret;
@@ -795,6 +807,7 @@ static int corsairpsu_probe(struct hid_device *hdev, const struct hid_device_id
 
 	priv->hdev = hdev;
 	hid_set_drvdata(hdev, priv);
+	spin_lock_init(&priv->completion_lock);
 	init_completion(&priv->wait_completion);
 
 	hid_device_io_start(hdev);
@@ -848,12 +861,20 @@ static int corsairpsu_raw_event(struct hid_device *hdev, struct hid_report *repo
 				int size)
 {
 	struct corsairpsu_data *priv = hid_get_drvdata(hdev);
+	unsigned long flags;
 
-	if (completion_done(&priv->wait_completion))
+	if (size < 2)
 		return 0;
 
-	memcpy(priv->cmd_buffer, data, min(CMD_BUFFER_SIZE, size));
-	complete(&priv->wait_completion);
+	spin_lock_irqsave(&priv->completion_lock, flags);
+	if (priv->rcv_pending && !completion_done(&priv->wait_completion) &&
+	    data[0] == priv->cmd_buffer[0] &&
+	    (data[1] == priv->cmd_buffer[1] || data[1] == 0)) {
+		memcpy(priv->res_buffer, data, min(CMD_BUFFER_SIZE, size));
+		complete(&priv->wait_completion);
+		priv->rcv_pending = false;
+	}
+	spin_unlock_irqrestore(&priv->completion_lock, flags);
 
 	return 0;
 }
-- 
2.55.0

