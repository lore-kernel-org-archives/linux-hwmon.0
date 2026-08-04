Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9757414DD3
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 18:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785868643; cv=none; b=uLZNeqZAaXPvoUX1c9lozlIWuIyp+VmLVaWWXDUwj/KZ5LrZ8PC5ThgUAuG7FqPgXSzGeerYuFMgDO5zzEG7Ix37Fy+x9tk11lB1dER7BRmPFnu0UAmntW7M8Jnhc6c7hVP58akaLYdgiy0ICCnp+EaaA6CZZxlfdLy2VRdcRFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785868643; c=relaxed/simple;
	bh=1nLknvHXdQ0732u3HGylZVvf2h0WNyOYcKgx9FlyP7E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kBb2h4aTqSrK7BXhOpGkNb9y0zUaPnx957p3xvwx+oDWXk8bkgVt/E0i4FpWZMBUWeVCsiSnWtvNZy8SbayYe3L5KjRCu62xxUm6sYZSsMWgfCoS/8mGbbfgx1YYhNHopKJPdwHn47avN8PgS68iXqjseeViOR0ENgwQCyYaQig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=Fe6Sn6CE; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="Fe6Sn6CE"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 03A5A240028
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 20:37:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1785868638;
	bh=tHgCG8vliCKuN3KfPoBBovJAQct/2btdok1JBzR7r6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=Fe6Sn6CEKT2DEjX/XDoEljBkORhLg1iWnD/3enXvFsT2vq7DAFHj74FG5GZSCExOU
	 RpV5/a1qGd7gkthuDW+7+dl30w+vgIwGvTBFKRFGg0RVGRwEbl5MCRymJtuB3ksx8o
	 VxqqgZhKXcNVvbm2NqRjBi3viP+0haKXkq+7dMjqdeX6LzSDFRuhAM7dLKrERgV2kK
	 QhjrjWU9C1cxq/7/jQVmIX9ZaVf7RRv9TQHC0OTsochgZIfOYOx0ZMTIcf9OEyq+JV
	 ySdoE8Zwie+knTNM99hoBNXrrPrRbLA10AYbpL7afgcabeTrSmsurgL9NysddtvfyJ
	 OgJv1JziPlZZQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hF2Md2tsQz6twY;
	Tue,  4 Aug 2026 20:37:17 +0200 (CEST)
Date: Tue, 04 Aug 2026 18:37:17 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Ali Ahmet Memis <ali@iusegentoo.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) serialize debugfs access against
 hwmon
Message-ID: <20260804203716.6391e866@posteo.net>
In-Reply-To: <0a50dbe2-4df8-4952-8090-cd97ece2a6c9@roeck-us.net>
References: <20260802123653.19532-1-ali@iusegentoo.com>
	<20260802145745.6f444fc2@posteo.net>
	<85f8ccd7-0d2a-43db-8690-cf220bd76e32@roeck-us.net>
	<20260804001347.164873-1-ali@iusegentoo.com>
	<ec30f5bb-48bc-485a-a7a6-953af65a66f5@roeck-us.net>
	<20260804061110.575adfc2@posteo.net>
	<0a50dbe2-4df8-4952-8090-cd97ece2a6c9@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 4 Aug 2026 09:34:38 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On Tue, Aug 04, 2026 at 04:11:11AM +0000, Wilken Gottwalt wrote:
> > > 
> > > Gemini tells me that fixing the raw event problem will require a spinlock to
> > > protect the completion and a separate receive buffer. No idea if it is correct,
> > > but other drivers do the same, so it may have a point. Either case, this is a
> > > bit too much to do without hardware to test, and I'd rather prefer to leave this
> > > up to Wilken.
> > 
> > I was working at that one, too, because I saw Claude Opus hinting on that one.
> > But it drove me crazy, because every AI is saying something slighty different. I
> > can not really pin down which one is actually the real solution. I tried to read
> > through the subsystems code and other drivers, but, argh, I don't know. I was
> > playing with the idea to (1) remove the raw HID mode completely or (2) make the
> > driver switchable, raw HID or normal HID, but not both at the same time. On the
> > other hand, in my Github repo where I develop the driver, I also have a tool
> > which demonstrates how to access the PSU completely in userspace via libhidpi.
> > There is actually no need to provide the raw HID access.
> > 
> 
> Have a look at the patch below. It is part AI (Gemini) generated and part me.
> Sashiko is happy with it, but of course that doesn't mean it is perfect or
> even correct. It does look good to me, though.
> 
> Making Sashiko happy required all core elements of the patch:
> - the spinlock
> - the separate receive buffer
> - the rcv_pending boolean
> - the size check in corsairpsu_raw_event()
> 
> Sashiko reports race conditions if I drop just one of those elements.
> 
> Guenter
> 
> ---
> From 50fae138603a9a6b1929cbe9a644310495688eea Mon Sep 17 00:00:00 2001
> From: Guenter Roeck <groeck@google.com>
> Date: Mon, 3 Aug 2026 17:39:21 -0700
> Subject: [PATCH] hwmon: (corsair-psu) Separate request/response buffers and
>  validate reply echo
> 
> In corsairpsu_usb_cmd(), a single shared buffer (priv->cmd_buffer) is used
> both for transmitting command reports via hid_hw_output_report() and for
> receiving device responses in corsairpsu_raw_event().
> 
> If a command sent via corsairpsu_usb_cmd() times out, the caller stops
> waiting, but the hardware may still process the command and send a delayed
> response later. If a subsequent command is being prepared or transmitted
> when this delayed response arrives, corsairpsu_raw_event() blindly copies
> the incoming report into priv->cmd_buffer and completes wait_completion:
> 
> corsairpsu_raw_event()
>     if (completion_done(&priv->wait_completion))
>         return 0;
> 
>     memcpy(priv->cmd_buffer, data, min(CMD_BUFFER_SIZE, size));
>     complete(&priv->wait_completion);
> 
> This causes a data race where priv->cmd_buffer can be overwritten with
> the old delayed response while hid_hw_output_report() is transmitting the
> new command, potentially causing the PSU to receive invalid parameters or
> shut down. In addition, the caller of the subsequent command will wake up
> early and either consume stale data or fail unexpectedly.
> 
> Fix the problem by:
> - Allocating a separate response buffer (priv->res_buffer) so that
>   corsairpsu_raw_event() never modifies priv->cmd_buffer during outgoing
>   transfers.
> - Validating incoming reports in corsairpsu_raw_event() to ensure that the
>   echoed length and command opcode match the pending command in
>   priv->cmd_buffer (or indicate an unsupported command opcode with 0).
> - Protecting buffer initialization, reinit_completion(), and report
>   validation/completion with a spinlock (wait_completion_lock).
> - Adding a boolean flag indicating that the code is waiting for a response,
>   and only copying the reply into the receive buffer if that is the case.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Guenter Roeck <groeck@google.com>
> ---
>  drivers/hwmon/corsair-psu.c | 33 +++++++++++++++++++++++++++------
>  1 file changed, 27 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> index 5592b927e9d4..3eebf8494ed8 100644
> --- a/drivers/hwmon/corsair-psu.c
> +++ b/drivers/hwmon/corsair-psu.c
> @@ -13,6 +13,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> +#include <linux/spinlock.h>
>  #include <linux/types.h>
>  
>  /*
> @@ -122,7 +123,10 @@ struct corsairpsu_data {
>  	struct device *hwmon_dev;
>  	struct dentry *debugfs;
>  	struct completion wait_completion;
> +	spinlock_t completion_lock;	/* locks wait_completion, cmd_buffer, and res_buffer
> */ u8 *cmd_buffer;
> +	u8 *res_buffer;
> +	bool rcv_pending;
>  	char vendor[REPLY_SIZE];
>  	char product[REPLY_SIZE];
>  	long temp_crit[TEMP_COUNT];
> @@ -158,15 +162,19 @@ static int corsairpsu_dutycycle_to_pwm(const long dutycycle)
>  
>  static int corsairpsu_usb_cmd(struct corsairpsu_data *priv, u8 p0, u8 p1, u8 p2, void *data)
>  {
> +	unsigned long flags;
>  	unsigned long time;
>  	int ret;
>  
> +	spin_lock_irqsave(&priv->completion_lock, flags);
>  	memset(priv->cmd_buffer, 0, CMD_BUFFER_SIZE);
> +	memset(priv->res_buffer, 0, CMD_BUFFER_SIZE);
>  	priv->cmd_buffer[0] = p0;
>  	priv->cmd_buffer[1] = p1;
>  	priv->cmd_buffer[2] = p2;
> -
>  	reinit_completion(&priv->wait_completion);
> +	priv->rcv_pending = true;
> +	spin_unlock_irqrestore(&priv->completion_lock, flags);
>  
>  	ret = hid_hw_output_report(priv->hdev, priv->cmd_buffer, CMD_BUFFER_SIZE);
>  	if (ret < 0)
> @@ -182,11 +190,11 @@ static int corsairpsu_usb_cmd(struct corsairpsu_data *priv, u8 p0, u8 p1,
> u8 p2,
>  	 * was send, not every command is supported on every device class, if a command is not
>  	 * supported, the length value in the reply is okay, but the command value is set to 0
>  	 */
> -	if (p0 != priv->cmd_buffer[0] || p1 != priv->cmd_buffer[1])
> +	if (p0 != priv->res_buffer[0] || p1 != priv->res_buffer[1])
>  		return -EOPNOTSUPP;
>  
>  	if (data)
> -		memcpy(data, priv->cmd_buffer + 2, REPLY_SIZE);
> +		memcpy(data, priv->res_buffer + 2, REPLY_SIZE);
>  
>  	return 0;
>  }
> @@ -781,6 +789,10 @@ static int corsairpsu_probe(struct hid_device *hdev, const struct
> hid_device_id if (!priv->cmd_buffer)
>  		return -ENOMEM;
>  
> +	priv->res_buffer = devm_kmalloc(&hdev->dev, CMD_BUFFER_SIZE, GFP_KERNEL);
> +	if (!priv->res_buffer)
> +		return -ENOMEM;
> +
>  	ret = hid_parse(hdev);
>  	if (ret)
>  		return ret;
> @@ -795,6 +807,7 @@ static int corsairpsu_probe(struct hid_device *hdev, const struct
> hid_device_id 
>  	priv->hdev = hdev;
>  	hid_set_drvdata(hdev, priv);
> +	spin_lock_init(&priv->completion_lock);
>  	init_completion(&priv->wait_completion);
>  
>  	hid_device_io_start(hdev);
> @@ -848,12 +861,20 @@ static int corsairpsu_raw_event(struct hid_device *hdev, struct hid_report
> *repo int size)
>  {
>  	struct corsairpsu_data *priv = hid_get_drvdata(hdev);
> +	unsigned long flags;
>  
> -	if (completion_done(&priv->wait_completion))
> +	if (size < 2)
>  		return 0;
>  
> -	memcpy(priv->cmd_buffer, data, min(CMD_BUFFER_SIZE, size));
> -	complete(&priv->wait_completion);
> +	spin_lock_irqsave(&priv->completion_lock, flags);
> +	if (priv->rcv_pending && !completion_done(&priv->wait_completion) &&
> +	    data[0] == priv->cmd_buffer[0] &&
> +	    (data[1] == priv->cmd_buffer[1] || data[1] == 0)) {
> +		memcpy(priv->res_buffer, data, min(CMD_BUFFER_SIZE, size));
> +		complete(&priv->wait_completion);
> +		priv->rcv_pending = false;
> +	}
> +	spin_unlock_irqrestore(&priv->completion_lock, flags);
>  
>  	return 0;
>  }

I don't know, something is odd about this. I'm not 100% sure, but the lock is
released before hid_hw_output_report(), which is necessary because a spinlock
must not be held by a potentially sleeping call. This leaves a window in which
a delayed reply can satisfy a freshly reinitialized wait_completion() even
before the actual send, if the new command has the same echo (p0/p1) as the old
one. And that is precisely the typical scenario when polling the same sensor
attributes (always 3, 0x8B for rail voltage). Or I just misinterpret this whole
thing entirely, I'm getting tired...

greetings Wilken
