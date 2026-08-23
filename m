Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220D831C56D
	for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 18:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787509084; cv=none; b=gAoAfmtUnpfFyGkKb38/BPIpRhx/Pz1Xyqyc0J+GClqJbdy6L92Fp1QksWmQfMpWi9945hi9Vz0HHQ9SlImgnykS6atTLb/IVEpyifJksqiK05yyC5QZb9JrI6y37830V1qiBXVyAYHLaqD1recaBRwN0ufq0Mq4X0+Hpl7M4go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787509084; c=relaxed/simple;
	bh=WdY04eCk7spoHtB+N47ozuJoRRdOHGAuFVJjIHdIlVc=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=UXf/YkA/sWeK/qd1SUoP1UNhbKZLsrh37FtHIcXdbCnjPpzZ1YDAHRAQ7WAUnXzDuXvjhg3+7vhx3LoEZJ2w+TPBRowRDtvpF0fnEigTwz6BSD/MtCMNf+s1eX3LR4moauEljK7LC/31Nzn+yP9qIs7zZ/wm+sOLR0P/M7USjto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMVT2xWA; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMVT2xWA"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a41191c9a9so5456057a12.3
        for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 11:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787509081; x=1788113881; darn=vger.kernel.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yCBOHLhJT1PV+LlMP1wEuVaF6BdnZ363LdD4GD0pcQg=;
        b=dMVT2xWADHXgFlXukxCaq+5jIRdGTjl6Wv0MVtRvw5nowAoqXs02JFleH2F6kClXco
         Qk3oBCIGKjCVFPYCMEBHtWGYwvXo7fejHQwewoADoSQ7AjnV+WMAyk8Izs1ECAzDHF16
         X/bSHnS6WaHi7FUYoeLxkba7zuHFzRVvlqHzcPQFzXfVJRodkDp8/7vwvMyxGTkNwLbh
         E1o0gqkqMFHz5jeexUCgRRdm/JVOlZZuP7U4LbMDlrM+2kTa5bainvvrGQpIz6twIW6v
         +SYwcHf6Pgo7NL0+HtLBpAWBa90g2GxHLwCnBud1rLsVd1I23ZhBPfiGELEoBSzB/LNs
         Aa4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787509081; x=1788113881;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCBOHLhJT1PV+LlMP1wEuVaF6BdnZ363LdD4GD0pcQg=;
        b=UKCJ0KUZ8tPcr3jZtzSgf6Kl7BB5UfhemmdG04dRSG4EloKcA4QGJCKAFYJNVybK2K
         4r+pXf/7ERgRM6SDDJYsZelE4ffJUHn2WmMkC52H/bTc9OkKD+rWOEbKgRiz71lVgs/6
         Z+azDkswFdGLQtzJbk5a4Pa1bQLhxyGkNRAuZuLi5ASLCYuZnZ94nJjj1TNXOakR+CSA
         aw7sabrfyMc0fjwbNPFChlpMTP0A2oFfKR4kazc8peRtepqjiekIZGAoRXhJ+x0Iw6hk
         gu2ZbYNxbV+Ya32nxk/3nGwlpMmuECkgNJezqtJV/Oj1vzxg2H1EoTAS2ZhOuZiIVKRs
         /phg==
X-Gm-Message-State: AFuF++nJiH2uVuOqylClCr8KY2RYf4rq9tFMfShNiyAv5Ey5GpA12AiN
	nuej5maIgTmrUkC9j1jPyy+gSQjBz57/IDmBnsF3wRTxgkkLvsImz53u
X-Gm-Gg: AR+sD10LdfPTWBCsNE+Xhsx9haFMnd9jj08ERpTqhJ6a51XYL+JN/gnL37iiwfZzBfS
	F6i2jYMLeKCxS+1kGu39a7wFmi1bA3473cssoJRbk4uaYS86PP/enfUgZxBKlLyBrdiyfYz19wy
	zsGLclK0G7EMEI33TKSQliFTA9AcQcBMiLicYK2RBye7iOCbG6QshO7M88ZmRzBsxh/CXVX83dj
	R11hkLfDw8KTsgzHDOkDeOiynAK8FLmxA7QXSshJaurQorVu/FDDhvUpsW1AoN7BMe3vbKjrxZr
	FXlZWbsbcTxbPbTf2F4Ug8ke6BxvAEmH0EF7FCUucBP71DtEYW4OyGWHDtsW4j1AFXxGu3BUKg0
	xTZZh/qQEgY/H7fUFbC9DpiixaEpUDwewEwAL58cKalvvz9U+jcK4Cx3Ol2uWg45iot/auHZvcP
	O/itaRnYdVEPtDlrY0sUm4060DqQy3VV0SjN+OVsYaR6zJc5LbM56zrrVWyZ9rxk3ImRquHAy0H
	g==
X-Received: by 2002:a05:6402:210f:b0:6a1:23f3:26b7 with SMTP id 4fb4d7f45d1cf-6a42f1e89dcmr24457892a12.14.1787509081288;
        Sun, 23 Aug 2026 11:18:01 -0700 (PDT)
Received: from localhost ([2001:4bb8:148:9afb:9d58:e892:a563:60d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e02a8fbsm6032590a12.13.2026.08.23.11.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 11:18:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 23 Aug 2026 20:17:57 +0200
Message-Id: <DKWJ321CZRCA.39H45VLLL6WSH@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>, "Guenter Roeck" <linux@roeck-us.net>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v2 1/4] hwmon: chipcap2: fix channels in humidity alarm
 notifications
Cc: <linux-hwmon@vger.kernel.org>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com>
 <20260823-chipcap2_locks-v2-1-6a26c8e9e2fc@gmail.com>
 <20260823181108.476DA1F000E9@smtp.kernel.org>
In-Reply-To: <20260823181108.476DA1F000E9@smtp.kernel.org>

On Sun Aug 23, 2026 at 8:11 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Unaligned memory access when casting byte arrays to `__be16 *`
> - [High] Incorrect endianness conversion for SMBus word write breaks on B=
ig-Endian architectures
> --
>
> --- Patch [1]: [PATCH v2 1/4] hwmon: chipcap2: fix channels in humidity a=
larm notifications ---
> commit e05e5dc803c6cf895cd85ba5388bb75fbd791d04
> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>
> hwmon: chipcap2: fix channels in humidity alarm notifications
>
> hwmon_notify_event() expects the channel number as its last argument,
> taken into account with the type parameter that it is a humidity sensor
> type. Given that this device only provides one humidity channel, 0 must
> be passed. The custom construct to enumerate the channels makes wrong
> assumptions by listing all types together (temperature and humidity).
>
> Remove the custom channel enumeration and pass the right channel to
> hwmon_notify_event() for hwmon_humidity_min_alarm and
> hwmon_humidity_max_alarm.
>
>> diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
>> index 086571d556b7e..9bef767b589ee 100644
>> --- a/drivers/hwmon/chipcap2.c
>> +++ b/drivers/hwmon/chipcap2.c
>> @@ -92,11 +92,6 @@ struct cc2_data {
>>  	bool process_irqs;
>>  };
>>
>> -enum cc2_chan_addr {
>> -	CC2_CHAN_TEMP =3D 0,
>> -	CC2_CHAN_HUMIDITY,
>> -};
>> -
>>  /* %RH as a per cent mille from a register value */
>>  static long cc2_rh_convert(u16 data)
>>  {
> [ ... ]
>> @@ -499,7 +494,7 @@ static irqreturn_t cc2_low_interrupt(int irq, void *=
data)
>>
>>  	if (cc2->process_irqs) {
>>  		hwmon_notify_event(cc2->hwmon, hwmon_humidity,
>> -				   hwmon_humidity_min_alarm, CC2_CHAN_HUMIDITY);
>> +				   hwmon_humidity_min_alarm, 0);
>>  		cc2->rh_alarm.low_alarm =3D true;
>>  	}
>>
>> @@ -512,7 +507,7 @@ static irqreturn_t cc2_high_interrupt(int irq, void =
*data)
>>
>>  	if (cc2->process_irqs) {
>>  		hwmon_notify_event(cc2->hwmon, hwmon_humidity,
>> -				   hwmon_humidity_max_alarm, CC2_CHAN_HUMIDITY);
>> +				   hwmon_humidity_max_alarm, 0);
>>  		cc2->rh_alarm.high_alarm =3D true;
>>  	}
>
> While reviewing this patch, I noticed a couple of pre-existing issues in
> drivers/hwmon/chipcap2.c that you might want to look into.
>
> drivers/hwmon/chipcap2.c:cc2_write_reg() {
> ...
> 	cpu_to_be16s(&val);
> 	ret =3D i2c_smbus_write_word_data(data->client, reg, val);
> ...
> }
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does this endianness conve=
rsion
> work correctly on Big-Endian architectures?
>
> The SMBus protocol always transmits the least-significant byte first.
> On a Little-Endian CPU, cpu_to_be16s() correctly swaps the bytes in memor=
y,
> causing SMBus to send the high byte first, matching the Big-Endian device=
's
> expectations.
>
> However, on a Big-Endian CPU, cpu_to_be16s() is a no-op, so the SMBus cor=
e
> extracts the actual least-significant byte and sends it first, resulting =
in
> Little-Endian transmission over the wire. Should this use
> i2c_smbus_write_word_swapped() instead to ensure writes to device
> configuration aren't corrupted?
>
>
> drivers/hwmon/chipcap2.c:cc2_read_reg() {
> ...
> 	ret =3D i2c_master_recv(data->client, buf, CC2_EEPROM_DATA_LEN);
> 	if (ret !=3D CC2_EEPROM_DATA_LEN)
> 		return ret < 0 ? ret : -EIO;
>
> 	*val =3D be16_to_cpup((__be16 *)&buf[1]);
> ...
> }
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does casting the unaligned
> address &buf[1] to a 16-bit pointer cause an unaligned memory dereference=
?
>
> Dereferencing an unaligned pointer using be16_to_cpup() can cause an
> alignment fault and kernel oops on architectures that strictly enforce
> memory alignment (e.g., SPARC or older ARM). This also happens in
> cc2_data_fetch() when casting &data[2] to a 16-bit pointer:
>
> drivers/hwmon/chipcap2.c:cc2_data_fetch() {
> ...
> 	switch (type) {
> 	case hwmon_humidity:
> 		*val =3D cc2_rh_convert(be16_to_cpup((__be16 *)&data[0]));
> 		break;
> 	case hwmon_temp:
> 		*val =3D cc2_temp_convert(be16_to_cpup((__be16 *)&data[2]));
> ...
> }
>
> Is there a safer way to parse these bytes without casting potentially
> unaligned byte array addresses?

I will take a look at this and send another patch if it applies.

Best regards,
Javier
