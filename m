Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D1F47DD7A
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 08:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574460; cv=none; b=I0l/PlUYUaVylTMtit1rAz79BoHpJPfk3BVeUEVyfJ9gTSBKyuaSkfJkf8dPPvYQZhuO43PMS+I/KT4zjUh/rokBj0mTh7CgNAmzNIgxq6Jtvm76XKi3BhKvtS6HgzBFbzVACJmD4MM53ByIPWf+MXw7+/1kvsZsdsaY1d+/QW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574460; c=relaxed/simple;
	bh=ZTEA2HdnjfCI9FQGyKiUf4vkUNGZFMRD1SeoOJUqdNA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Q496h3PzBXH2YIvQTLML565Ow2tBtbpzoqrPMcM+rFcN6l7xsKWj0nmsk+cm44WSDS7iN6ejJaUE4X6gLkFAcBDJ2aQiR93C0yjrD9CufEfpXu+P5u9djBBKUJrsLuec/K915xAAooa2YWJcosvYTbD5rsEeiF46//9/J6Oi8/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=jJeKW0yH; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="jJeKW0yH"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1330d6bb78dso1736440c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 01:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778574457; x=1779179257; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45jcoL8Jg+P3cfU+/0k5pK8BmuLH8yz4uxFezEXSjvU=;
        b=jJeKW0yHQfxtdf4mHYkGz6JEP0HQpdyhRrWTiwkGF4zm7LIt8CsxzbSqt3TRmeiaap
         TR47NEnyNrXT/hlSuPxaIL5CauSm6WMYnx7MCCAYehNXOj7TfRkwvjUuKI/56IP0rJkK
         ZJ1pj43EMYeR7nxDETwlooVYXtYCy/RVos31iRasoHv2lY8ax1OgSrmLOhIXUm3TwSqR
         TyxxDQ2SsLnd1twz8wXSyfyoYn3g4RNYZ/j5I55eJGZJFI8ffDxpBGIIi2THPhcjj4oR
         yNNUjC7ycGj2uOmHeV9skjRsRrn/jtRuepryXmg55C8rQGNBAtRt5fxQlaiEZ6XJ4Lfw
         E7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778574457; x=1779179257;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=45jcoL8Jg+P3cfU+/0k5pK8BmuLH8yz4uxFezEXSjvU=;
        b=OFvC27njq1VWbqKbkh0q+/CCOaICdAyVIB0kTl+579Wz1Zy17kWeIK3jCTyFWwmCVQ
         LLEsWmhJNEzsjhmF2edVvj2Lua7gD18ULrpFQORUI2+NG69O8RWixP7p9gndZ2C7QIbz
         kWdFxyMaK/gJygmV4mRNXzjH9w80hx9UVyoDi7SX5EJn0PCX5EmxN5KM7OFyJqLhKvDy
         JJHFS129+LjzjsmDMrLTdqdX6yOpntDzvjm5oRsWoRyGc+rpMVfiLAqcS1E3pXH+3q/6
         jcyDbXhgdZcFOsd9Us8FoFexeQGtiwhtavF/CF2cHriEFUTwK1GQQflAUOpErX5Hz+aR
         fYzw==
X-Gm-Message-State: AOJu0YyyJjd/OkWh1XkA0ssEwXa3sgE+D1iR/gJl0Ppsi9/Is9jT8N3J
	YSVlt5Sam+8GNFimPVLHidnix1eTzu/aMSXpErci0G4QQJ4vToVvKl9df4ZszBy+aHI=
X-Gm-Gg: Acq92OF5tA69f//rYvFd2VQO9sVsKsJjc9bM5mWoVQy2yoJmmZu3eQNX9KZ7AROZthJ
	8gaZHpRQmVnlf39WJ5OpckZv+Nwp7+m9NwOspM3KxXCtDfaaR9kfMpVl+gKzSY73qoduMnCaC0P
	5J4gIkPBReNZ7J0eScaO4HWQGC+hUINDPiqM30RqECFSxYpoP4/G2m7Ty1qXmXCttfoysfIFH5D
	UutYv7cwHUWsH0+QuxntQoV7w4Dnr+HGeyFqa5/wv5TpefhTEXhY3vlyig7Cazll+2QwvZUgwbe
	gGWHEj+aiBxiMbKNXhv9lZp0w3b9myv4cMYwDPDF+kqiDnWtcaMGPApQMw1knwyLa6cInZl6JP4
	SlA/tMpYcTnzyVu44m0n1f0FJboGZ9DX+4o3RbzaIBQ1u5hd/xiJ9qktwMIggH+TmShJNj4lCe/
	3LSpsZNIArV/0fr/OtU6/dUlY=
X-Received: by 2002:a05:7022:260a:b0:12c:34b9:61bc with SMTP id a92af1059eb24-13344b2f7femr1272482c88.5.1778574457372;
        Tue, 12 May 2026 01:27:37 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278210ff2sm18280950c88.6.2026.05.12.01.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:27:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 01:27:35 -0700
Message-Id: <DIGK0X9I3A0U.2A2QP1GD1983O@nexthop.ai>
Cc: <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH RESEND v2 2/5] hwmon: (pmbus/adm1266) add clear_blackbox
 debugfs entry
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: <sashiko@lists.linux.dev>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260511-adm1266-v2-2-7a6d34f0de5d@nexthop.ai>
 <20260512005252.763EAC2BCB0@smtp.kernel.org>
In-Reply-To: <20260512005252.763EAC2BCB0@smtp.kernel.org>

On Mon May 11, 2026 at 5:52 PM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The debugfs write handler `adm1266_clear_blackbox_write` perform=
s an I2C transaction without acquiring the required hardware monitoring loc=
ks, violating hwmon subsystem guidelines.
> --
>
> commit ab9c19373562d58415e28511b037545cfd278c2a
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> Subject: hwmon: (pmbus/adm1266) add clear_blackbox debugfs entry
>
> This commit adds a debugfs entry to clear the ADM1266 blackbox buffer by
> issuing a block-write command to the device. This is needed when the
> device operates in single-recording mode to preserve fault history.
>
>> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266=
.c
>> index 7b8433226176f..31aefa8fc75f5 100644
>> --- a/drivers/hwmon/pmbus/adm1266.c
>> +++ b/drivers/hwmon/pmbus/adm1266.c
>
> [ ... ]
>
>> +static ssize_t adm1266_clear_blackbox_write(struct file *file, const ch=
ar __user *ubuf,
>> +					    size_t count, loff_t *ppos)
>> +{
>> +	struct i2c_client *client =3D file->private_data;
>> +	u8 payload[2] =3D { 0xFE, 0x00 };
>> +	int ret;
>> +
>> +	ret =3D i2c_smbus_write_block_data(client, ADM1266_READ_BLACKBOX,
>> +					 sizeof(payload), payload);
>
> Does this I2C block write need to be protected by hwmon_lock() and
> hwmon_unlock()?
>
> The hardware monitoring subsystem guidelines require drivers to implement
> locking for attributes registered outside of the core registration functi=
ons,
> such as debugfs entries.
>
> Without these locks, could this write operation race with other multi-rec=
ord
> transactions? For example, if this clear command is interleaved while
> adm1266_nvmem_read_blackbox() is iterating through multiple records, migh=
t
> it corrupt the read sequence?
>
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return count;
>> +}

Good catch!

Will use pmbus_lock_interruptible() in v3.

