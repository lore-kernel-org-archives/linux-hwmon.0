Received: from mx02lb.world4you.com (mx02lb.world4you.com [81.19.149.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E509259C
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Apr 2025 20:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744317543; cv=none; b=uEIAdfH9xrt39PVrzvSNR3G8f+RJ1WwWKrHfFAhG/cvhxfFC3AdSJXeFPvM8TNarirN+X2mHB/0KVhfYnfpCiaYr4Cai/8GHwFSOjAIlAShvibi3X3lxTeDHd4ifMyADi7SMd7ffUiuvTR/3Pk4+7MdzLInSGdjB/+LrFi1Ccp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744317543; c=relaxed/simple;
	bh=jBRjGc74xhIs3DXLdbRzyqsZxs/AFxY78DrDKskAMxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UvfAGrFiitBDyIF6rQvPhKhmps9TTcMdMuCitNSK+7p26JK1N/xhJgB3RaBtnprx9qElOZOxcAPxCuDQl0zplp/2VX2Ag9HMP/xbRHB+HhSaMKb93D9yxg4n2snfTfEyWpan9ZNjqg+cNwUacswNKgLvBH7rMSp7QJXWwBn0sUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=Bpeth0k8; arc=none smtp.client-ip=81.19.149.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="Bpeth0k8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wqwJq1Zyc4EGRc9zZYSMWTqBd76XI1sIXUidnNXjtXc=; b=Bpeth0k8fv5jfUTLDEDbIkTIGB
	B2/lLAGXze2sziPvPJ5mT5AYrg62BAmVSArlWQA2BmNmwus+H3D/n3UrEVYrlhpU6Qq5+9rTiXK5l
	f/2AY5bzSSLNeG4R2R6jff3/K6gvu3GH6e9F5qLnJH2YY5IvBGWsWFKQSZWrY+lR7/Uc=;
Received: from [188.22.33.74] (helo=[10.0.0.160])
	by mx02lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1u2xWF-000000000TO-0DoN;
	Thu, 10 Apr 2025 21:25:01 +0200
Message-ID: <c1a67d09-a23a-4ba8-bf8b-19f3f6d2eb34@engleder-embedded.com>
Date: Thu, 10 Apr 2025 21:24:57 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: Add KEBA battery monitoring controller support
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, linux@weissschuh.net,
 Gerhard Engleder <eg@keba.com>
References: <20250409190830.60489-1-gerhard@engleder-embedded.com>
 <651ce8b5-4257-4d38-aa18-285698ab7856@roeck-us.net>
Content-Language: en-US
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <651ce8b5-4257-4d38-aa18-285698ab7856@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Do-Run: Yes

On 09.04.25 22:11, Guenter Roeck wrote:
> On Wed, Apr 09, 2025 at 09:08:30PM +0200, Gerhard Engleder wrote:
>> From: Gerhard Engleder <eg@keba.com>
>>
>> The KEBA battery monitoring controller is found in the system FPGA of
>> KEBA PLC devices. It puts a load on the coin cell battery to check the
>> state of the battery. If the coin cell battery is nearly empty, then
>> the user space is signaled with a hwmon alarm.
>>
>> The auxiliary device for this driver is instantiated by the cp500 misc
>> driver.
>>
>> Signed-off-by: Gerhard Engleder <eg@keba.com>
>> ---
> ...
>> diff --git a/drivers/hwmon/kbatt.c b/drivers/hwmon/kbatt.c
>> new file mode 100644
>> index 000000000000..501b8f4ded33
>> --- /dev/null
>> +++ b/drivers/hwmon/kbatt.c
>> +
>> +		/* check battery state */
>> +		if (ioread8(kbatt->base + KBATT_STATUS_REG) &
>> +		    KBATT_STATUS_BAT_OK)
>> +			kbatt->alarm = false;
>> +		else
>> +			kbatt->alarm = true;
>> +
> 
> 		kbatt->alarm = !(ioread8(kbatt->base + KBATT_STATUS_REG) & KBATT_STATUS_BAT_OK);
> 
>> +		/* switch load off */
>> +		iowrite8(0, kbatt->base + KBATT_CONTROL_REG);
>> +
>> +		kbatt->next_update = jiffies + KBATT_MAX_UPD_INTERVAL;
>> +	}
>> +
>> +	mutex_unlock(&kbatt->lock);
>> +
>> +	return kbatt->alarm;
>> +}
>> +
>> +static int kbatt_read(struct device *dev, enum hwmon_sensor_types type,
>> +		      u32 attr, int channel, long *val)
>> +{
>> +	struct kbatt *kbatt = dev_get_drvdata(dev);
>> +
>> +	*val = kbatt_alarm(kbatt) ? 1 : 0;
> 
> and
> 
> 	*val = kbatt_alarm(kbatt);
> 
> would have been equivalent and a bit simpler. Also, kbatt_is_visible()
> could have just returned 0444 without any checks since there is only one
> attribute and it is always present. However, I am tired of arguing today,
> so applied.

Thanks for applying! I will try to make you less tired next time.

Gerhard

