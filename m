Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF83B4218B6
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 14:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349891; cv=none; b=baTa3mUH8Hwe5qxbACA6vMV52ISddVFo+kj+ba9W8kRXn/NIANK5BWUaI4rkE7fhAR+raTABvdXWf2OAfz1AQZIEPj8mkVXURKXrgFGwbRtNhHmEf7Y9vhDFW0J8TlHUD48t4tccaWO0ZJOm9onGN8LplSCDb530DuUL3xDSTHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349891; c=relaxed/simple;
	bh=0nAurCx+2HLKDovwWCKAtT5IEziSKOyaTEJTFAez43g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EedTDuF3zFOix5pkVNUTOyE5DmrLHOuN/Tbnq+WIC4/Vfe1EjNj+DvnstLu7EtR+hbHzh91Ao8UJ62xWt8Zc0kCaAxnJ9JGgStcbHkV2rdiyl15W49GuITBsKq0dhH6bfyzkq67IfZTfAf44wcyaZ8G4wdfEBKs27wrYobyAjqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSupx7rB; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSupx7rB"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8478cc93299so3424053b3a.2
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 07:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783349889; x=1783954689; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=QwBq5u7bFEHwJF5T0zRXgqkbC9myofYieZIJN4GwjB8=;
        b=DSupx7rBFyQO7O+IxNUPb6d9WS5IulJmC1wlDOGFDK2qQRwQcYrV5nYe1KwSmhB9r3
         1bAA5Aych0C+/DGm7pctuf0Plep6TqP3KfecvOfl2iBqJAKMCGnEM48LlLADPE77JGpM
         +yvLEgvktyC564wM3wS3XO80ML3jQ4jcvLvnQvzznafULJ8ZUWHC/Km17TlETKlFxBr/
         3pqGAgmF64ynIxpUZ5H/5HNhdh1E/Ge6eU8ndQdAtSpDE3c+8rrRNC2I5QRWLwM8ejgE
         XmVA/9zU1UYRAiu750KYsL5EAvlMwEoc+qD4avokLuvMt+lLjGVzSj5epSfxsxyKJjMS
         CnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783349889; x=1783954689;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QwBq5u7bFEHwJF5T0zRXgqkbC9myofYieZIJN4GwjB8=;
        b=Lns+wyiVqcRwk4VrtDNr1lPvl6PUvOVlGnlAUKe1QbyxAbr/V0yVupq7HP0KQLLV44
         yxQ5R/UHhaz/7ZR0FDkQTgVWQJEpk6ImpJwGcLv8vspTLwi5t9GuLctzSYdnyv9FBtLu
         cD21fXYzmITN//OmW1KJ26yfPnfZRuJM1S6WxsJjUCQhsbr1UUECD2ZBSZH1daDPMHGG
         xBoeG1ZA3E8ataw33D24wfpWJW4sGywBEakrSGn6VlnUI2zxK1Xo/qIONxlrYzOGtnJ0
         tzpuz8OAqjoIiath5rpVNheBwtdqea8QEjHgx4GzEnZaMVuzL6xbIy+y2XOh3qGq70wK
         2zAw==
X-Forwarded-Encrypted: i=1; AHgh+RrNqFJ3TtlN+nwBzYqhXVLmVgaLr00QXRCGNj6wNvBPVfiQupVWq0DJOPfBaeSK2vSMQMts7vNdelsXaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxev4kuq9jU+PXDN0e4O1px8mowr+a9L1k7VsYe3VbCr4waF+ug
	kt78KQKt8vu4FOVpivOK2xj+6MBH669wF2+vCrK2bSDDT/IJtDvCqQWQLX0maQ==
X-Gm-Gg: AfdE7cnTQ1BWTu5UTsyhftTnaUk2FhfitxoTsOgWXJIXWzyW5wA1mXDe+FDP9sDPWa9
	JGJ6ns81qxnJ8puzVlK7ElHgQ0vF8CH6TfVKpXfBSFlfpKZ+bGmsejZ2+HYgKUIQQ64bPKrcc4n
	SOCL4kplPSFUiDa9YfyPb8qN32hd6IFYn4eWmRRV8QWuOBWAAVIqZooklUZZQNuHluSpRr2FO1c
	i1Gkk+cAzcf+pU8QoiKRFpyE5Uq2O90unbA6/G/5v1uNlNpzVTs6k2KsHHaztAqRemmVrb9th4z
	Qo4Sh2bYWB00EMIbWRqDL9OrIFKw6e6oUhnLHCaBGqZEvtb/03dXtixCnIleEKPn92gl1bQ1bJF
	5IOBxvipQfF5Enu45hkwyJBjiBBcbNwnBBJ9E+rZ2n7jjq9kQk3Rr3MGqAMVXs2NKZwCR5lKPHP
	MLYaDDxY0vYcq6FmAwoPjeEL+nHwRCnrSEHCY6QgKmad4yVHO9g9hUZ2FnepN0GMEdMM4tVBDX
X-Received: by 2002:a05:6a00:1488:b0:847:7ffd:ce35 with SMTP id d2e1a72fcca58-84826bf907emr1019058b3a.8.1783349889044;
        Mon, 06 Jul 2026 07:58:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7a96fsm3957292b3a.46.2026.07.06.07.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 07:58:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fb69c193-cbb3-47a9-a315-7828bcd4f51f@roeck-us.net>
Date: Mon, 6 Jul 2026 07:58:07 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] hwmon: add Altera SoC FPGA hardware monitoring
 driver
To: "NG, TZE YEE" <tze.yee.ng@altera.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1783062999.git.tze.yee.ng@altera.com>
 <577acf0d5355db7d9b73c78e142649aefaf92d28.1783062999.git.tze.yee.ng@altera.com>
 <20260703081848.C5A831F000E9@smtp.kernel.org>
 <4b5bd901-44c7-415a-88c0-461217c0a9df@altera.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <4b5bd901-44c7-415a-88c0-461217c0a9df@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/6/26 01:59, NG, TZE YEE wrote:
> On 3/7/2026 4:18 pm, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [High] Incorrect devm registration order causes a Use-After-Free vulnerability during device unbind or probe failure.
>> - [Medium] Unreferenced `completion` causes a guaranteed maximum timeout delay on every asynchronous sensor read.
>> --
>>
>> commit 9e088a070299b309352aa9a88006e3927d0c50bd
>> Author: Tze Yee Ng <tze.yee.ng@altera.com>
>>
>> hwmon: add Altera SoC FPGA hardware monitoring driver
>>
>> Add a hardware monitor driver for Altera SoC FPGA devices using the Stratix 10
>> service layer. Sensor channels are selected based on the service layer
>> compatible string.
>>
>>> diff --git a/drivers/hwmon/socfpga-hwmon.c b/drivers/hwmon/socfpga-hwmon.c
>>> new file mode 100644
>>> --- /dev/null
>>> +++ b/drivers/hwmon/socfpga-hwmon.c
>> [ ... ]
>>> +static int socfpga_hwmon_async_read(struct device *dev,
>>> +				    enum hwmon_sensor_types type,
>>> +				    struct stratix10_svc_client_msg *msg)
>>> +{
>>> +	struct socfpga_hwmon_priv *priv = dev_get_drvdata(dev);
>>> +	struct stratix10_svc_cb_data data = {};
>>> +	struct completion completion;
>>> +	unsigned long wait_ret;
>>> +	void *handle = NULL;
>>> +	int status, index, ret;
>>> +
>>> +	init_completion(&completion);
>>> +
>>> +	for (index = 0; index < HWMON_ASYNC_MSG_RETRY; index++) {
>>> +		status = stratix10_svc_async_send(priv->chan, msg, &handle,
>>> +						  NULL, NULL);
>>> +		if (status == 0)
>>> +			break;
>>> +		dev_warn(dev, "Failed to send async message: %d", status);
>>> +		msleep(HWMON_RETRY_SLEEP_MS);
>>> +	}
>>> +
>>> +	if (status && !handle) {
>>> +		dev_err(dev, "Failed to send async message after %u retries: %d\n",
>>> +			HWMON_ASYNC_MSG_RETRY, status);
>>> +		return status;
>>> +	}
>>> +
>>> +	/*
>>> +	 * The service layer never invokes the async callback, but wait
>>> +	 * before polling anyway: RSU uses the same pattern and the firmware
>>> +	 * needs time to complete the transaction after async_send().
>>> +	 */
>>> +	wait_ret = wait_for_completion_io_timeout(&completion, HWMON_TIMEOUT);
>>
>> [Severity: Medium]
>> Will this cause a guaranteed timeout delay on every sensor read?
>>
>> In socfpga_hwmon_async_read(), a local completion is initialized but is
>> never passed to any asynchronous function or callback (the function
>> stratix10_svc_async_send() receives NULL for the callback).
>>
>> Because the completion can never be signaled, the execution will
>> unconditionally block in an uninterruptible sleep for the entire
>> HWMON_TIMEOUT duration on every single sensor read. Only after this maximum
>> timeout expires does the function proceed to poll for the response.
>>
>>> +	if (wait_ret > 0)
>>> +		dev_dbg(dev, "Received async interrupt\n");
>> [ ... ]
>>> +static int socfpga_hwmon_probe(struct platform_device *pdev)
>>> +{
>> [ ... ]
>>> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, "socfpga_hwmon",
>>> +							 priv,
>>> +							 &socfpga_hwmon_chip_info,
>>> +							 NULL);
>>> +	if (IS_ERR(hwmon_dev)) {
>>> +		if (priv->async)
>>> +			stratix10_svc_remove_async_client(priv->chan);
>>> +		stratix10_svc_free_channel(priv->chan);
>>> +		return PTR_ERR(hwmon_dev);
>>> +	}
>>> +
>>> +	ret = devm_add_action_or_reset(dev, socfpga_hwmon_release_svc, priv);
>>
>> [Severity: High]
>> Does this devres registration order create a use-after-free vulnerability
>> during device unbind?
>>
>> In socfpga_hwmon_probe(), the hwmon device is registered via
>> devm_hwmon_device_register_with_info() before the cleanup action
>> socfpga_hwmon_release_svc is added via devm_add_action_or_reset().
>>
>> Because devres unwinds actions in reverse order of addition (LIFO), upon
>> device unbind, socfpga_hwmon_release_svc will execute first, freeing the
>> service layer channel (priv->chan).
>>
>> However, the hwmon device will still be active and its sysfs attributes
>> accessible to user space during this time. A concurrent sysfs read can
>> invoke socfpga_hwmon_read(), which will attempt to use the already-freed
>> priv->chan, resulting in a use-after-free.
>>
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	platform_set_drvdata(pdev, priv);
>>> +	return 0;
>>> +}
>>
> 
> Hi maintainers,
> 
> 1. [High] Incorrect devm registration order causes a Use-After-Free
> vulnerability during device unbind or probe failure.
> 
> Agreed. v4 will register devm_add_action_or_reset() before
> devm_hwmon_device_register_with_info(), matching other hwmon drivers
> (e.g. pwm-fan, qnap-mcu-hwmon). On hwmon registration failure, probe
> returns and devm runs the release action automatically, so manual
> channel cleanup on that path is no longer needed.
> 
> 2. [Medium] Unreferenced `completion` causes a guaranteed maximum
> timeout delay on every asynchronous sensor read.
> 
> Agreed that the completion is never signaled because the service layer
> does not invoke the async callback. rsu_send_async_msg() in
> stratix10-rsu.c uses the same send → wait → poll pattern, so we followed
> RSU for consistency with the existing Stratix 10 async SVC client.
> 

Sorry, I am not willing to accept the "other code is buggy, therefore
it is ok to introduce the same bug here" argument (Is that some new
trend ? I hear it so often lately that I am getting tired of it).
You'll have to provide a better argument explaining why it would make
sense to call wait_for_completion_io_timeout() if it is known to always
time out. You might as well just call usleep_range() or similar; while
that would still be bad code, at least it would not be misleading.
Just add a comment explaining the reason when you do that.

Guenter

