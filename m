Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456673;
	b=Td6N8gJTYnuKv/6qCK+YfGBQ6IqXjfw54SyuukJrUMbrRDHXaa30KKF330dmJndd/eJd
	 bO+6dbIIdHeTinH9DWlKki7q+sEm4ft/EOih6c0JgS79vB88FapJEUM0el6PJgDd6qC7f
	 QGGaEAhUnWusD+R4XJeuGRkImokX1vXmOxZUQAvjeAFvsjmz+mTOczdWiixpBBB3ttHP9
	 HzlP8A7v5mDC4E9qCJy8E9Ionpb1JdYydfj3oVX0GzTRaHa8BNMqlJ1ccCNfwBTugLUwj
	 1JoASl/EUbmfF0Zf5o9wVceABQJ5CII4nphIdaTqtfyHhd+RvNx2VUGX8ZRIfTN+OQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=cj+Y2wfpwLr7td89AsxYNJnNaEEpW/nPb32UAYlfdpg=;
	b=qdbzIVXe3FEItgtRnulNyxu8Ow6jlvTWv/HkrgQIc9gpONAz8qVNdRR/brZgefUFg1Xl
	 8aj6NvksJb5nj/1XQ3lK5JlIzadrslDUdEJUZlZY5YxUJjcY2ALWjNKeR8iyW/LWObkx9
	 muXh/jMOEt1kZ0/JQVjw1E9m1UrY7VIpUjOLpRyM6fluas6e2kDrpATAqKs3YwXE1Spjc
	 UBG8d6NqHg1SsImnEIxt6JqVrNQEMqkAbPYh4LfkCNY+cYftLY6gMV5t8xX0YAN3A48vv
	 hPB5w5NtrszM3XXOaghx310x6Q81jZGtHcl1+H7E+6liGlyIt77EemgqWZBw0B/5Y1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HoJ21nRT;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8927606A320
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 00:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8927606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HoJ21nRT
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so959992b3a.0
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 17:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456672; x=1793061472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cj+Y2wfpwLr7td89AsxYNJnNaEEpW/nPb32UAYlfdpg=;
        b=HoJ21nRTUjpGbvAvwoM0A3IDw8iYuYragj9mE2q0g1RKza8+BjMp0k/JBT93j6PEpA
         254ypVF0sBgfoOdk+ypdb9ku1HrGPCFGPHpdDAhJxKQH8XOtdIH7UESzHjEvxrrRG96E
         szKEZwxqiSIib6pocVx0gg1cnj/P02nIJqyYtUy/Sh0JdbwyZlYHV3gzfFZe9uQgqigk
         OJ6X+XNRVOXN6GitpCb06wj1XrgsGiMt2l62rUNjor1/ROez7dvi6PXgmpkabsfUBJEi
         ggzrv8av0X/JD6gLvDeRzv0ks/NuKbtwIgXgcSaXu1wNYTvoMFQxn4YTDMCnzQyhyorv
         64JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456672; x=1793061472;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cj+Y2wfpwLr7td89AsxYNJnNaEEpW/nPb32UAYlfdpg=;
        b=vIRnWtA2LDHdwi878IQJXMPQ5J7TJz0pZVqB8K+QTxz23Hvok27uECmcaSbcI77Ak/
         v6rbz+grgDpu7sdeZEnwPEduonSCY9hlgUgVzaQkEj7VKuXx3J2A1PnbJ9sW5BRsEQWE
         ccLqRv5KxPGlfILPzcKNgff7opd6VJElA1fPTXDZJa7sCtmIjvSEZT+e8s9y+FvOPU7T
         frwEDh3bwluqhfM6YhN2pV0/Zn4NjafNYNUBuLI9WjknBn7JO40ewX+pQyHCG7egagoM
         74WxLe+r4buWCAUtqdOhUZqqOUh2fOm6/qlDjAOh3uzWeH2nbj5ReUAQTJO2zO7USpqj
         jbkg==
X-Gm-Message-State: AFq9FYJQUOoCgTCNgIOr0HbGetyUJr+QPSPPiMqjjhcK3YhXWLWneI8K
	R4H0+dwbVtgc0edJVMiTJA8g+kYLbAyoY1Bcho7Rz9HjQXXHR+tTQ+TJ
X-Gm-Gg: AYBFou0HjcDPpdIOiSO/Hd37ZLrxX/N+uDQX3bwdjJ2BeWY2TGk69IKhUvNAtxrg2Ga
	F2X40RyzLaHiMIBPbDI5S9HO6T/DVBBNqm9SSLXnYc4OQWv78DJeqaPGcXvTJC8Pf17HcZDuwBM
	TdPcI0W3WTWtEGC4HS/GgVE/sNHJFT/5fH4Zt0n2399a2Wk3KgbuZ81bQNO9q8JvnigOYdeNODN
	iXhGcdEkePf145uPPINJzAUyvYl/SnP0oMdFD758JZW9fl8dBLfni3bnESHZPSvDpg1sSTSgZ0e
	0st7gdTlYEAbSF5HXIn7QxVIY7vbO8jPHvEl5HQuLa7aO1vbR1ZptVJJhhuGdQvvMKhWK85TmkI
	T850y7TMOqoMFKoOxzYjvh11sqE9tmtCr6YN3PryHrB7ocUNdRE4iANH4YV5mQyN1bTeb46iu+a
	w5qN8doAKP1nVxxba3CCUwbBDwPJ9ePwXxaFVoythEtz8Qsu8dSDVECRrsN/9O8wNTa2c+7/fi4
	RttPiYBUoAV+x6t2+3yUTbue+1WG/YXyaOtpXeSobTp934r
X-Received: by 2002:a05:6a00:2304:b0:89f:f428:5482 with SMTP id d2e1a72fcca58-8a04ba055c1mr7963615b3a.19.1792456671837;
        Mon, 19 Oct 2026 17:37:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89fcfd2cd79sm3929643b3a.24.2026.10.19.17.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 17:37:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1fe09bc6-2341-48f3-80b5-0d9dc02796a9@roeck-us.net>
Date: Mon, 19 Oct 2026 17:37:48 -0700
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (sht15) Stop deferred work before releasing its
 resources
To: Myeonghun Pak <mhun512@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ijae Kim <ae878000@gmail.com>
References: <20261019234402.805759-1-mhun512@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261019234402.805759-1-mhun512@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/26 16:44, Myeonghun Pak wrote:
> The IRQ handler can queue read_work, which accesses GPIOs and may re-enable
> that same IRQ.  A measurement can return while read_work is still pending
> or running.  The regulator notifier can also queue update_supply_work,
> which accesses the regulator.  Neither work item was drained on removal
> or on all probe failure paths before the managed resources were released.
> 
> Use request_irq() and free_irq() since the IRQ must be released at an
> explicit point in the teardown sequence.  Disable and drain read_work
> before freeing the IRQ.  Unregister the regulator notifier before draining
> update_supply_work and disabling the regulator.
> 
> Use IRQF_NO_AUTOEN to ensure that the IRQ stays disabled until the first
> measurement, rather than enabling it briefly between request_irq() and
> disable_irq_nosync().  Cache the IRQ number and check errors from
> gpiod_to_irq().
> 
> Fixes: 251eb40f5ccd ("hwmon: sht15 humidity sensor driver")
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> Compile-tested (W=1). No runtime testing.
> 
> Changes in v2:
> - Replace managed IRQ request/free with request_irq()/free_irq().
> - Use IRQF_NO_AUTOEN and cache the data GPIO IRQ.

That replaces a relatively simple patch with a much more complex
one, and Sashiko takes offense with it. What is the problem with
the original code ?

Guenter

> - Preserve asynchronous work drain ordering on probe failure and remove.
> 
>   drivers/hwmon/sht15.c | 47 +++++++++++++++++++++++++++++++++--------------
>   1 file changed, 33 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
> index 7bb2105d1ae223e7131ba4cc0523e4e074e01302..c95acec7ae2f8f57a10bd72f65a2905e64c3c58c 100644
> --- a/drivers/hwmon/sht15.c
> +++ b/drivers/hwmon/sht15.c
> @@ -31,6 +31,7 @@
>   #include <linux/bitrev.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/of.h>
> +#include <linux/workqueue.h>
>   
>   /* Commands */
>   #define SHT15_MEASURE_TEMP		0x03
> @@ -120,6 +121,7 @@ static const u8 sht15_crc8_table[] = {
>    * struct sht15_data - device instance specific data
>    * @sck:		clock GPIO line
>    * @data:		data GPIO line
> + * @irq:		interrupt number for the data GPIO line.
>    * @read_work:		bh of interrupt handler.
>    * @wait_queue:		wait queue for getting values from device.
>    * @val_temp:		last temperature value read from device.
> @@ -149,6 +151,7 @@ static const u8 sht15_crc8_table[] = {
>   struct sht15_data {
>   	struct gpio_desc		*sck;
>   	struct gpio_desc		*data;
> +	int				irq;
>   	struct work_struct		read_work;
>   	wait_queue_head_t		wait_queue;
>   	uint16_t			val_temp;
> @@ -532,9 +535,9 @@ static int sht15_measurement(struct sht15_data *data,
>   		return ret;
>   	atomic_set(&data->interrupt_handled, 0);
>   
> -	enable_irq(gpiod_to_irq(data->data));
> +	enable_irq(data->irq);
>   	if (gpiod_get_value(data->data) == 0) {
> -		disable_irq_nosync(gpiod_to_irq(data->data));
> +		disable_irq_nosync(data->irq);
>   		/* Only relevant if the interrupt hasn't occurred. */
>   		if (!atomic_read(&data->interrupt_handled))
>   			schedule_work(&data->read_work);
> @@ -546,7 +549,7 @@ static int sht15_measurement(struct sht15_data *data,
>   		data->state = SHT15_READING_NOTHING;
>   		return -EIO;
>   	} else if (ret == 0) { /* timeout occurred */
> -		disable_irq_nosync(gpiod_to_irq(data->data));
> +		disable_irq_nosync(data->irq);
>   		ret = sht15_connection_reset(data);
>   		if (ret)
>   			return ret;
> @@ -825,7 +828,7 @@ static void sht15_bh_read_data(struct work_struct *work_s)
>   		 * have gone low in meantime so verify it hasn't!
>   		 */
>   		atomic_set(&data->interrupt_handled, 0);
> -		enable_irq(gpiod_to_irq(data->data));
> +		enable_irq(data->irq);
>   		/* If still not occurred or another handler was scheduled */
>   		if (gpiod_get_value(data->data)
>   		    || atomic_read(&data->interrupt_handled))
> @@ -976,25 +979,31 @@ static int sht15_probe(struct platform_device *pdev)
>   		goto err_release_reg;
>   	}
>   
> -	ret = devm_request_irq(&pdev->dev, gpiod_to_irq(data->data),
> -			       sht15_interrupt_fired,
> -			       IRQF_TRIGGER_FALLING,
> -			       "sht15 data",
> -			       data);
> -	if (ret)
> +	data->irq = gpiod_to_irq(data->data);
> +	if (data->irq < 0) {
> +		ret = data->irq;
> +		goto err_release_reg;
> +	}
> +
> +	ret = request_irq(data->irq, sht15_interrupt_fired,
> +			  IRQF_TRIGGER_FALLING | IRQF_NO_AUTOEN,
> +			  "sht15 data", data);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to get irq for data line\n");
>   		goto err_release_reg;
> -	disable_irq_nosync(gpiod_to_irq(data->data));
> +	}
> +	/* IRQ remains disabled until a measurement starts. */
>   	ret = sht15_connection_reset(data);
>   	if (ret)
> -		goto err_release_reg;
> +		goto err_free_irq;
>   	ret = sht15_soft_reset(data);
>   	if (ret)
> -		goto err_release_reg;
> +		goto err_free_irq;
>   
>   	ret = sysfs_create_group(&pdev->dev.kobj, &sht15_attr_group);
>   	if (ret) {
>   		dev_err(&pdev->dev, "sysfs create failed\n");
> -		goto err_release_reg;
> +		goto err_free_irq;
>   	}
>   
>   	data->hwmon_dev = hwmon_device_register(data->dev);
> @@ -1007,9 +1016,14 @@ static int sht15_probe(struct platform_device *pdev)
>   
>   err_release_sysfs_group:
>   	sysfs_remove_group(&pdev->dev.kobj, &sht15_attr_group);
> +err_free_irq:
> +	/* The read worker can re-enable the IRQ, so drain it first. */
> +	disable_work_sync(&data->read_work);
> +	free_irq(data->irq, data);
>   err_release_reg:
>   	if (!IS_ERR(data->reg)) {
>   		regulator_unregister_notifier(data->reg, &data->nb);
> +		cancel_work_sync(&data->update_supply_work);
>   		regulator_disable(data->reg);
>   	}
>   	return ret;
> @@ -1023,12 +1037,17 @@ static void sht15_remove(struct platform_device *pdev)
>   	hwmon_device_unregister(data->hwmon_dev);
>   	sysfs_remove_group(&pdev->dev.kobj, &sht15_attr_group);
>   
> +	/* The worker can re-enable the IRQ, so stop it before free_irq(). */
> +	disable_work_sync(&data->read_work);
> +	free_irq(data->irq, data);
> +
>   	ret = sht15_soft_reset(data);
>   	if (ret)
>   		dev_err(&pdev->dev, "Failed to reset device (%pe)\n", ERR_PTR(ret));
>   
>   	if (!IS_ERR(data->reg)) {
>   		regulator_unregister_notifier(data->reg, &data->nb);
> +		cancel_work_sync(&data->update_supply_work);
>   		regulator_disable(data->reg);
>   	}
>   }

