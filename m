Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4C1395ACE
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 10:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581249; cv=none; b=ijy4zpBERvN2IHpMDUKShe0m1ZBI4X50EDhUJtc1B/luig52oNYrBZUADWNWbRn3gc1Zc5FOAMy3RuxforQo/Y/5rxvZizRNVwHIJXO3YwHrwFeaAHAwacQeHTBMMkalpiSN7PQ3IaEglIW+lHY2tFmaU3DIcSFv/dHd3IQx3lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581249; c=relaxed/simple;
	bh=SfMR8ph/aPqhGNyEYBNhukujwK6NQ6K/VhGWQkkPA+s=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=a3KchSj8Y+RYlz0irFcAWKsyjfwlCagLXGzaGx6ftqy2Sks2rDWe2k6J6YZAlMoMqbwe4pdkRPWwmaJlItXa3T2YSgy+XCPTX8VKg9onqA3cfPujytCHDfurMOmt/HQW+GmfVNgBYSwZaQBupF38gwwNKAtIk8whbidfcETIZ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=djq76ZhZ; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="djq76ZhZ"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2f3c623322bso8878118eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 03:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778581247; x=1779186047; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqUnbh/8mkmgbpEJCpiA7aFzpeOAsnV9e0B1Z7F32dw=;
        b=djq76ZhZxvzhzUcJmCTEA1W97VJTEhP+SXg3sixqPnC933GZXqZwfqCV0E6r+wH14K
         FKsAMaMBynUMB7SEEQM8xsl/b6a4Wphxfam5vh+rkmaMltjvm+Q+87XSwvZkZauUPNU7
         N3Jn/jBrErpCeClrPFh03HHu53Y+4nIYrvFHI0d5jKTrALeijENpl0+z2LyhbssjpOHc
         zgl5qQ/maPivEnTOeaCRBXwopxDBcHTVweoj1H9U0vt0jnfeC9jrBUls0tPeK9AnZJMu
         EruB+tK+ddDi8jsSksXeZUl0jf+W2LBX0RDw4KtppdVzeguw+7V/ptsCtwkGyzra9FJ/
         MLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778581247; x=1779186047;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hqUnbh/8mkmgbpEJCpiA7aFzpeOAsnV9e0B1Z7F32dw=;
        b=j7DjHLOaZ9wb6oNDKQuEUkaJi/kzPtj4dypcRmx4CBAiGVQU7g38kHvQD8SOg8Hz6h
         DRpgItfH0s43dTUP8hfFSwn8YVlG4tIivXyJVHfl+KiOx1dRtP0Bw2BNv/LenvoKWQkw
         39O5on8ae+ErNjOmYKFzl5k0rKt2hl8iB07rBu5vCQk3TYFJfI1sfL4KrgIjgpa3lBlB
         d60oIW6UFcuLmuIqRIYdNFhVoKSvmbO7jMk024nPQwWjjH4QkSjWLHNe0r8VnwVvk8DF
         Z3sELF+kKB0duRqHhSruSmSUsYJE9vyOQAQ50lYn26oTyAGgTa4vvemJT+QFaWpVonT7
         2N9Q==
X-Gm-Message-State: AOJu0YxDAu/jVpKO42hz3pDin7PnaZxQ9WGkuc6daW4RDw9cv8QExfmP
	7xj7jCW3w22BkGsep9ktoGx8iKgYh6IF4rAgG4z9qHmWFjEdbfylCx09oDuyHC93OfwPEJew1J8
	MkCuejpY=
X-Gm-Gg: Acq92OH3zOSJpadwhxvg2hLUelcYN1ZQ2f5JE3uFNIm0HlBCBI0voTzGs8tRvCNLsug
	UvRfKLgisgYIXJV05DEchlVc/20g16DZVVclCHEtmESx0tzDgYMYNUDtPOsje4Cwml+KuPtxsWR
	SGwyWVzZLDqcmzIZoZXVmNRpiNcPRnaSMggSo8X3kONwryXwq1ECnewE53pN5BK5RZg8b3xMND5
	jn2DRaxm7ZAExHP1M9SaCiOhwUugcc3Qj7YVgOpvyUoJsD9CN7rlY9uYrP1rAWlMsXj4AawkL0U
	FMhD4oBvPgLiQsqIKhqBidduHDaMAzjKQ61pIgroKIndnroQ0co+uk9yY4m+c2BWkqmId+bV8Pc
	gcUkfbwdboXWaN/NQvUgvw+8NvLn1Q+NhyhJgLcK/MrgbazJqT7BKFlVGQAuUSU6oYQPtwF6yYi
	eDLPBh36qum8CXz6A0e0RPl+M=
X-Received: by 2002:a05:7300:e60c:b0:2dd:6937:79bc with SMTP id 5a478bee46e88-2f54ad72f58mr14257224eec.6.1778581247146;
        Tue, 12 May 2026 03:20:47 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm20468431eec.10.2026.05.12.03.20.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 03:20:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 03:20:46 -0700
Message-Id: <DIGMFKP4POUI.2ZTJ4UM3GJW02@nexthop.ai>
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Guenter Roeck" <linux@roeck-us.net>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>, <sashiko@lists.linux.dev>
Cc: <linux-hwmon@vger.kernel.org>, "Guenter Roeck" <groeck7@gmail.com>
Subject: Re: [PATCH RESEND v2 2/5] hwmon: (pmbus/adm1266) add clear_blackbox
 debugfs entry
X-Mailer: aerc 0.21.0
References: <20260511-adm1266-v2-2-7a6d34f0de5d@nexthop.ai>
 <20260512005252.763EAC2BCB0@smtp.kernel.org>
 <DIGK0X9I3A0U.2A2QP1GD1983O@nexthop.ai>
 <eaf93149-a7cf-4a11-8ccc-8aa1b1e83b7e@roeck-us.net>
In-Reply-To: <eaf93149-a7cf-4a11-8ccc-8aa1b1e83b7e@roeck-us.net>

On Tue May 12, 2026 at 2:19 AM PDT, Guenter Roeck wrote:
> On 5/12/26 01:27, Abdurrahman Hussain wrote:
>> On Mon May 11, 2026 at 5:52 PM PDT, sashiko-bot wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
>>> - [High] The debugfs write handler `adm1266_clear_blackbox_write` perfo=
rms an I2C transaction without acquiring the required hardware monitoring l=
ocks, violating hwmon subsystem guidelines.
>>> --
>>>
>>> commit ab9c19373562d58415e28511b037545cfd278c2a
>>> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>>> Subject: hwmon: (pmbus/adm1266) add clear_blackbox debugfs entry
>>>
>>> This commit adds a debugfs entry to clear the ADM1266 blackbox buffer b=
y
>>> issuing a block-write command to the device. This is needed when the
>>> device operates in single-recording mode to preserve fault history.
>>>
>>>> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm12=
66.c
>>>> index 7b8433226176f..31aefa8fc75f5 100644
>>>> --- a/drivers/hwmon/pmbus/adm1266.c
>>>> +++ b/drivers/hwmon/pmbus/adm1266.c
>>>
>>> [ ... ]
>>>
>>>> +static ssize_t adm1266_clear_blackbox_write(struct file *file, const =
char __user *ubuf,
>>>> +					    size_t count, loff_t *ppos)
>>>> +{
>>>> +	struct i2c_client *client =3D file->private_data;
>>>> +	u8 payload[2] =3D { 0xFE, 0x00 };
>>>> +	int ret;
>>>> +
>>>> +	ret =3D i2c_smbus_write_block_data(client, ADM1266_READ_BLACKBOX,
>>>> +					 sizeof(payload), payload);
>>>
>>> Does this I2C block write need to be protected by hwmon_lock() and
>>> hwmon_unlock()?
>>>
>>> The hardware monitoring subsystem guidelines require drivers to impleme=
nt
>>> locking for attributes registered outside of the core registration func=
tions,
>>> such as debugfs entries.
>>>
>>> Without these locks, could this write operation race with other multi-r=
ecord
>>> transactions? For example, if this clear command is interleaved while
>>> adm1266_nvmem_read_blackbox() is iterating through multiple records, mi=
ght
>>> it corrupt the read sequence?
>>>
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	return count;
>>>> +}
>>=20
>> Good catch!
>>=20
>> Will use pmbus_lock_interruptible() in v3.
>>=20
>
> There is also "guard(pmbus_lock)(client);" or "scoped_guard(pmbus_lock, c=
lient) { ... }".
> Guenter

Thanks for the tip! Does that mean you're ok with losing the
interruptibility, since there's no DEFINE_GUARD_COND for interruptible
variant?

Abdurrahman

