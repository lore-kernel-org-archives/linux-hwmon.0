Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C121418A2D
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 20:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874481; cv=none; b=aF7U5rrbryM7wVaQNz2bx1xP/+rVW8eAbS7YlZz+PBjdsOHMCTU5XkDW5ix8ijJ1LsC57r25bfKqevvhV8LnmIzQ5wi5R7WfhRn6gY1V1SRD9BET9zb5ILldyUkXAea+Jxh0YnWO0qiEJ1q/ly9J9tT151mt10ypEas8xzYW/7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874481; c=relaxed/simple;
	bh=MDpgkmhm1GK1n69qGxlitSG3x/q7WqbhSpcIMoup7HA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ix0TWKjjAdZSgUu+1XvDKQC/tSl4hdsq4Z0jMM/ooP+oCapjAJCOcR/wE5HFBWC6KueU5KrkKq8ifSw1ddYKqLimwuAf1Zi0WU5ifTr5+hZ00nwJLUp7Q7MVTPcl4B35DzrKHp9f0zNMSXvjcKcriFEmNOqDiwj4Gsmb+tnNLxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oTR6JAne; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oTR6JAne"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8453427d3f4so277617b3a.3
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Aug 2026 13:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785874479; x=1786479279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+MS8liL0JxMKHQbXXzRk0cG3Q723nWEtmQPjzRH9mis=;
        b=oTR6JAnekzUZl7hUTdpCJSs/5hM66zEqyHFY3wPYRRrTdigsknBGkLkhXeuzjcMmmz
         ZUTFYrWdrV3SSPK1H7XvSYlQbYdh+A1qVGcZ6PRMiLiynUCJj24RLDiyebwaUbeYp+GC
         eB9zMoKe4OaLNlNACzWBBtznZLsaK4xPfpFyACoYIaUIV9EGXLUJdrqp/8wQ1NU8FX6v
         SWrT/2er+ZuzRNzDBYsjobU24gznCAqnOLznNw6/ZL3pqcHBHTXU2EU1CA+XhNJ8siGw
         ezQl1B4ZU9WOUzSHdNwzJvi+Hsq2Don9gX+eL9bjwOKsWJeMUuu2glnB0IAw1SpD59gP
         tqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785874479; x=1786479279;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+MS8liL0JxMKHQbXXzRk0cG3Q723nWEtmQPjzRH9mis=;
        b=SvhdR8XFjXNKmt+bPFevtvmPjTj4k8OGQiQ9LKfJk0yzqhpSYLdef+kDLetlgDarNo
         UkYMKJopBcNXfNTdKcemsLme3d+TaaRVbHib4H8chj/1WutTYQcXPFuup32nY+Z36W9V
         ZPjOEnRtNWpMos5Mq4WUDROmVwG8G1zH4uQ5tYFGzQtsrHAJiIzt0S/taCFjBlBg9Ja3
         vLeCdry4l+rDHLeYd0/MRWaxvGq5V++N9Io7eqFZ1xYRFPrDYJPaYMppd8l/+CxiVsHW
         UahT/wtWHYjPzxSKWIhxtecBuR9a5OjJ8p1+cLgvKHeIhPP+Yw6boyeEZfT4SnmuuawK
         1jqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rod57fuCkNkIlpRj+zewRJoC41EVFbZsZGYhfoklHm2t8xZikF0osx/IqL48D0IPLTNaJn26c9UuhKI6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0OcQj8Jn78a7Ph0WI38GyGKtI3I0a4FauDezbDxwiErimnQgP
	DVWcfzV9iYEWk9lf/D9+vE3d0hYxRRLpl+jIQ9lnbo1tVEcZBvEx4Hvng3N/pg==
X-Gm-Gg: AR+sD11zvNQPS7blUTxDZMGPxqDGZmFxiGciGKDDA/AWh/MBGKkC3E2g/EgDKDjgEST
	6of+9nxEtnc3L12Ax/iJnuXed+mjzqWuowh41ttkNi3XssQ0gGF/UngdjIy56F4PpnSgYLPiuF5
	FR2aNMeNUKZ7HH2i1kWfDxhLRdCm8+q4F/PbdU6ChHQTLbVbgek6qCmeNijKt3a9PMrbdbx4AHz
	Zd/XIxzx+KUpXybsYT5G87YZVmO799U2Xy3cCkEf0rzUHe6CTxQ1CmiEXscoaY7XCxazFbxWMTb
	natxz5bQaOTWOT2+1kn+pa6MlpT5Ly3FrGB+KbtYzjzOd/5dIGzNleovOlOV7RfM1kuUeVFZuKd
	wqJh4+MPCy9ALXXFvz1sFIJJzZNS/XzlFeZ0mxhAvkGm4soRqSn5e+bXoeJ4IQbZJrbgujBP0za
	thQ4dZKF78LDvm36bG4ScFtu0MU5T6kIWQiGVFwwI4/KHHgIuNzS+GzyiPQ31qnyb8LWcfkhQwN
	Y4x47lNKn96JjvOxMLJUp6c2CSB5eGUBKz/wA==
X-Received: by 2002:a05:6a20:7487:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3cb85e2b724mr1230793637.6.1785874478624;
        Tue, 04 Aug 2026 13:14:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe708c0ebesm218260a12.19.2026.08.04.13.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 13:14:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <95a24119-066d-4b9b-8ea8-e3bd5b3d014d@roeck-us.net>
Date: Tue, 4 Aug 2026 13:14:36 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (corsair-psu) serialize debugfs access against
 hwmon
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Ali Ahmet Memis <ali@iusegentoo.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260802123653.19532-1-ali@iusegentoo.com>
 <20260802145745.6f444fc2@posteo.net>
 <85f8ccd7-0d2a-43db-8690-cf220bd76e32@roeck-us.net>
 <20260804001347.164873-1-ali@iusegentoo.com>
 <ec30f5bb-48bc-485a-a7a6-953af65a66f5@roeck-us.net>
 <20260804061110.575adfc2@posteo.net>
 <0a50dbe2-4df8-4952-8090-cd97ece2a6c9@roeck-us.net>
 <20260804203716.6391e866@posteo.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260804203716.6391e866@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/4/26 11:37, Wilken Gottwalt wrote:
> On Tue, 4 Aug 2026 09:34:38 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On Tue, Aug 04, 2026 at 04:11:11AM +0000, Wilken Gottwalt wrote:
>>>>
>>>> Gemini tells me that fixing the raw event problem will require a spinlock to
>>>> protect the completion and a separate receive buffer. No idea if it is correct,
>>>> but other drivers do the same, so it may have a point. Either case, this is a
>>>> bit too much to do without hardware to test, and I'd rather prefer to leave this
>>>> up to Wilken.
>>>
>>> I was working at that one, too, because I saw Claude Opus hinting on that one.
>>> But it drove me crazy, because every AI is saying something slighty different. I
>>> can not really pin down which one is actually the real solution. I tried to read
>>> through the subsystems code and other drivers, but, argh, I don't know. I was
>>> playing with the idea to (1) remove the raw HID mode completely or (2) make the
>>> driver switchable, raw HID or normal HID, but not both at the same time. On the
>>> other hand, in my Github repo where I develop the driver, I also have a tool
>>> which demonstrates how to access the PSU completely in userspace via libhidpi.
>>> There is actually no need to provide the raw HID access.
>>>
>>
>> Have a look at the patch below. It is part AI (Gemini) generated and part me.
>> Sashiko is happy with it, but of course that doesn't mean it is perfect or
>> even correct. It does look good to me, though.
>>
>> Making Sashiko happy required all core elements of the patch:
>> - the spinlock
>> - the separate receive buffer
>> - the rcv_pending boolean
>> - the size check in corsairpsu_raw_event()
>>
>> Sashiko reports race conditions if I drop just one of those elements.
>>
>> Guenter
>>
>> ---
>>  From 50fae138603a9a6b1929cbe9a644310495688eea Mon Sep 17 00:00:00 2001
>> From: Guenter Roeck <groeck@google.com>
>> Date: Mon, 3 Aug 2026 17:39:21 -0700
>> Subject: [PATCH] hwmon: (corsair-psu) Separate request/response buffers and
>>   validate reply echo
>>
>> In corsairpsu_usb_cmd(), a single shared buffer (priv->cmd_buffer) is used
>> both for transmitting command reports via hid_hw_output_report() and for
>> receiving device responses in corsairpsu_raw_event().
>>
>> If a command sent via corsairpsu_usb_cmd() times out, the caller stops
>> waiting, but the hardware may still process the command and send a delayed
>> response later. If a subsequent command is being prepared or transmitted
>> when this delayed response arrives, corsairpsu_raw_event() blindly copies
>> the incoming report into priv->cmd_buffer and completes wait_completion:
>>
>> corsairpsu_raw_event()
>>      if (completion_done(&priv->wait_completion))
>>          return 0;
>>
>>      memcpy(priv->cmd_buffer, data, min(CMD_BUFFER_SIZE, size));
>>      complete(&priv->wait_completion);
>>
>> This causes a data race where priv->cmd_buffer can be overwritten with
>> the old delayed response while hid_hw_output_report() is transmitting the
>> new command, potentially causing the PSU to receive invalid parameters or
>> shut down. In addition, the caller of the subsequent command will wake up
>> early and either consume stale data or fail unexpectedly.
>>
>> Fix the problem by:
>> - Allocating a separate response buffer (priv->res_buffer) so that
>>    corsairpsu_raw_event() never modifies priv->cmd_buffer during outgoing
>>    transfers.
>> - Validating incoming reports in corsairpsu_raw_event() to ensure that the
>>    echoed length and command opcode match the pending command in
>>    priv->cmd_buffer (or indicate an unsupported command opcode with 0).
>> - Protecting buffer initialization, reinit_completion(), and report
>>    validation/completion with a spinlock (wait_completion_lock).
>> - Adding a boolean flag indicating that the code is waiting for a response,
>>    and only copying the reply into the receive buffer if that is the case.
>>
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Signed-off-by: Guenter Roeck <groeck@google.com>
>> ---
>>   drivers/hwmon/corsair-psu.c | 33 +++++++++++++++++++++++++++------
>>   1 file changed, 27 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
>> index 5592b927e9d4..3eebf8494ed8 100644
>> --- a/drivers/hwmon/corsair-psu.c
>> +++ b/drivers/hwmon/corsair-psu.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/kernel.h>
>>   #include <linux/module.h>
>>   #include <linux/slab.h>
>> +#include <linux/spinlock.h>
>>   #include <linux/types.h>
>>   
>>   /*
>> @@ -122,7 +123,10 @@ struct corsairpsu_data {
>>   	struct device *hwmon_dev;
>>   	struct dentry *debugfs;
>>   	struct completion wait_completion;
>> +	spinlock_t completion_lock;	/* locks wait_completion, cmd_buffer, and res_buffer
>> */ u8 *cmd_buffer;
>> +	u8 *res_buffer;
>> +	bool rcv_pending;
>>   	char vendor[REPLY_SIZE];
>>   	char product[REPLY_SIZE];
>>   	long temp_crit[TEMP_COUNT];
>> @@ -158,15 +162,19 @@ static int corsairpsu_dutycycle_to_pwm(const long dutycycle)
>>   
>>   static int corsairpsu_usb_cmd(struct corsairpsu_data *priv, u8 p0, u8 p1, u8 p2, void *data)
>>   {
>> +	unsigned long flags;
>>   	unsigned long time;
>>   	int ret;
>>   
>> +	spin_lock_irqsave(&priv->completion_lock, flags);
>>   	memset(priv->cmd_buffer, 0, CMD_BUFFER_SIZE);
>> +	memset(priv->res_buffer, 0, CMD_BUFFER_SIZE);
>>   	priv->cmd_buffer[0] = p0;
>>   	priv->cmd_buffer[1] = p1;
>>   	priv->cmd_buffer[2] = p2;
>> -
>>   	reinit_completion(&priv->wait_completion);
>> +	priv->rcv_pending = true;
>> +	spin_unlock_irqrestore(&priv->completion_lock, flags);
>>   
>>   	ret = hid_hw_output_report(priv->hdev, priv->cmd_buffer, CMD_BUFFER_SIZE);
>>   	if (ret < 0)
>> @@ -182,11 +190,11 @@ static int corsairpsu_usb_cmd(struct corsairpsu_data *priv, u8 p0, u8 p1,
>> u8 p2,
>>   	 * was send, not every command is supported on every device class, if a command is not
>>   	 * supported, the length value in the reply is okay, but the command value is set to 0
>>   	 */
>> -	if (p0 != priv->cmd_buffer[0] || p1 != priv->cmd_buffer[1])
>> +	if (p0 != priv->res_buffer[0] || p1 != priv->res_buffer[1])
>>   		return -EOPNOTSUPP;
>>   
>>   	if (data)
>> -		memcpy(data, priv->cmd_buffer + 2, REPLY_SIZE);
>> +		memcpy(data, priv->res_buffer + 2, REPLY_SIZE);
>>   
>>   	return 0;
>>   }
>> @@ -781,6 +789,10 @@ static int corsairpsu_probe(struct hid_device *hdev, const struct
>> hid_device_id if (!priv->cmd_buffer)
>>   		return -ENOMEM;
>>   
>> +	priv->res_buffer = devm_kmalloc(&hdev->dev, CMD_BUFFER_SIZE, GFP_KERNEL);
>> +	if (!priv->res_buffer)
>> +		return -ENOMEM;
>> +
>>   	ret = hid_parse(hdev);
>>   	if (ret)
>>   		return ret;
>> @@ -795,6 +807,7 @@ static int corsairpsu_probe(struct hid_device *hdev, const struct
>> hid_device_id
>>   	priv->hdev = hdev;
>>   	hid_set_drvdata(hdev, priv);
>> +	spin_lock_init(&priv->completion_lock);
>>   	init_completion(&priv->wait_completion);
>>   
>>   	hid_device_io_start(hdev);
>> @@ -848,12 +861,20 @@ static int corsairpsu_raw_event(struct hid_device *hdev, struct hid_report
>> *repo int size)
>>   {
>>   	struct corsairpsu_data *priv = hid_get_drvdata(hdev);
>> +	unsigned long flags;
>>   
>> -	if (completion_done(&priv->wait_completion))
>> +	if (size < 2)
>>   		return 0;
>>   
>> -	memcpy(priv->cmd_buffer, data, min(CMD_BUFFER_SIZE, size));
>> -	complete(&priv->wait_completion);
>> +	spin_lock_irqsave(&priv->completion_lock, flags);
>> +	if (priv->rcv_pending && !completion_done(&priv->wait_completion) &&
>> +	    data[0] == priv->cmd_buffer[0] &&
>> +	    (data[1] == priv->cmd_buffer[1] || data[1] == 0)) {
>> +		memcpy(priv->res_buffer, data, min(CMD_BUFFER_SIZE, size));
>> +		complete(&priv->wait_completion);
>> +		priv->rcv_pending = false;
>> +	}
>> +	spin_unlock_irqrestore(&priv->completion_lock, flags);
>>   
>>   	return 0;
>>   }
> 
> I don't know, something is odd about this. I'm not 100% sure, but the lock is
> released before hid_hw_output_report(), which is necessary because a spinlock
> must not be held by a potentially sleeping call. This leaves a window in which
> a delayed reply can satisfy a freshly reinitialized wait_completion() even
> before the actual send, if the new command has the same echo (p0/p1) as the old
> one. And that is precisely the typical scenario when polling the same sensor
> attributes (always 3, 0x8B for rail voltage). Or I just misinterpret this whole
> thing entirely, I'm getting tired...
> 
Unless I am missing something there is nothing you can do about this unless there
is a sequence number in the message. I think this is why the AI insists that there
is a separate receive buffer (to avoid overwriting the command buffer in this
scenario).

Guenter

