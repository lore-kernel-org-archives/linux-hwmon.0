Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899A138236F
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 22:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788302174; cv=none; b=uAVeZ43+0n39mS0n/8lkiRdiBPxi5sFA6tnotLhOQcCIe0VSp6rI8mHJvAdcibU7mOpu1aCwocJBVi/oFb5W933q3ClIoxfv8IQz/Dr8Gft73DV3m6zqjhVFkAo1G+YOfqhDlgUc0eyFMq4JoDdgnX8c1jhnRMYWDcxLxwAeVw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788302174; c=relaxed/simple;
	bh=j9mpkjfRn2jqQKj01jqAft3e9i3r6f6j21kOBzbUU/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JpFnd5H9+ZlWA5oZfIFdp+pZ1eW1+tXZhqC2hKSaOsiQRpHGAyEUqOwtD9FzijmwZpC+EsOYOBRuWn/eamMUHtqB+XWsxGQiC37IytjspaEd63g+cX8mD83E+UKShq1LYx/w49wuIABy/FstRNyQ5zE0Tcfr0cmKZ3vp8XxXux4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPCZQ6aX; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPCZQ6aX"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso3635245ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 15:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788302171; x=1788906971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=prUFXfJJvxBKDGudBAGlzsTLkCG5MrR+snKMetzZ6LM=;
        b=EPCZQ6aX6Z+G0xDrdX27HZJraOBNq2BVRxepxIziLkM35+9/IPQ7RUMbhIRZ23Z9DI
         VV6hVddxyy0Vbg+MyB5pe8Qgn62erXg5CuavcW76wKT+WnnbwIlmR7TMQJcod3Mw7B2U
         U1mjcby2QzGA5jyUkzv6uDTzPPO3//9npdvEbxnYADXHRa/bI4q6UyYN1X7vy1WClnkp
         /X7wUliSAPPa+o5ln8zeNxMSz0c/bbVe+E/1KQ0qMHVF79797VLEZmZfs7g3x5P2zQWG
         0BBa7061ob6jQyg80WQyQJwCRSLBtHvRlReSKzEEO5g/yfUpraLDnnNN62GaCT2zNWcE
         Xjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788302171; x=1788906971;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=prUFXfJJvxBKDGudBAGlzsTLkCG5MrR+snKMetzZ6LM=;
        b=DP+cTV+CoaJBIL1tH+QqD43yfBLhuUHw6KR+5UgoV3mQTfJhiLLnN4ngcfvtX6jzkI
         pUgiZLuPtBwRzMQGR0RAxZODqRMSXDoZT+t0Is3A/oGY9PDvjW7suOPfSL1N/3oHJPQy
         NmhtLwDBNa8Gg+pYwBxoTvHwjgqRfXx5phA1FKESxdzmnvJrTfFb/UscIChQRxch4mG5
         TSBDEypys9X9yYDT7J7zE2UoT1ZJnG85Lw4kuARkkki9aqFj4L5cnFB8VLz58xNyQAC3
         oI60MyYp7YbYAu+pB3Vi4Z4Kt4iZOBzJYNLJpv3E7WTo1KUHymadwiCGOV0gbBORENW3
         LJHw==
X-Gm-Message-State: AFuF++n+5KbLNArWRzO+qni0qp3j1ShcW94tksKHjffbrO8WScN/Ah9O
	LloZrpJecd0VvxAmurZQ/aSkJwrIwJ6wSPCcNUQHJwoKGH59uvGNQ9l8YuoNmw==
X-Gm-Gg: AYBFou3/wDu5jEH/gtg2P8MIJ6lYm7f7RVKng4zZ43wt6PE7tw0japGuX9LizquMQSH
	vnhjtHub7cla4eYBHplvIypNXQmh9OwZk9iae8orkcxefHApqohOaVvcBiGfFTVswMQA3CHuIyu
	kmX9Dhza0mahNp9YPsxykma/RpQpJ4lcFDKTeKcVsPl9JxrDYRcSdd3OBwMt6MWyRd+meM6IAW7
	cQRwyD2YTslmsKNOsHx4JM7Cc1y0xsheWQ/LDE24n70P7A9fFJZRzh/Q6T5f1+nB8cZJAShrIfh
	gmLpaRDpR8NS947+3Kv6BmwE22NJPWbK/KKb9Zx3912ax50iBPwGM1tSee8NzlPfGvhildyStaH
	4G2V9a8zTqI8Tf6tOFl5tQkOuC2uEGg3R67lIlWmNrwT579u4LkGhW9XQmyKSainK+dnSNQzS1i
	6I92gp0VCfySjnWEFkrUyIphn1YPUrIDy4TKs/UBqE/0bZIX+HCP6dFf3qeorpHAPxznZOBp61x
	L0f4hZYjN/0fX5QzWzVtuJsiMCsGRyTXjDlTg==
X-Received: by 2002:a17:903:198e:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2daec5ae6e2mr8529265ad.5.1788302170559;
        Tue, 01 Sep 2026 15:36:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b79cf9sm1082574eec.18.2026.09.01.15.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 15:36:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <49cafd78-2468-4b43-a376-a8b2e2de2c19@roeck-us.net>
Date: Tue, 1 Sep 2026 15:36:08 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
To: Matthew Bettencourt <matthew.bettencourt@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1a8ea9da-1ac1-4312-a8ca-ea4a9f35093f@gmail.com>
 <ee284272-0da0-45b6-a3be-c76822e5d54f@roeck-us.net>
 <014b9438-e9b7-4be1-b816-002e83a068a0@roeck-us.net>
 <37132c40-aa82-4df1-b5ce-337601f3c085@gmail.com>
 <3c4e9f59-5272-48cf-a4a0-eeefcba955a9@roeck-us.net>
 <763a8b30-8548-4ff0-a1e9-8e74bbfe9b02@gmail.com>
 <6e8761aa-67ef-4624-834d-4b9d0ce729d6@roeck-us.net>
 <9753ed80-5666-42a6-b04c-99b9ef9326fe@gmail.com>
 <5c17ea39-c479-4f88-adc6-9a86f3dfb96a@roeck-us.net>
 <d80cf68e-a6cb-4b0b-807e-313be29ca8ae@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <d80cf68e-a6cb-4b0b-807e-313be29ca8ae@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/1/26 13:53, Matthew Bettencourt wrote:
> Hello Guenter,
> 
> I updated the piix4_transaction() (code below) to only print when there are failures. I then left the computer idle (~30 mins) while reading i2c info and SPD temps and I never saw any failures.
> 
> I then did some sleep and resume with cycles with spd5118 driver enabled and that is when I started to see the error messages again in dmesg.It appears like there is always a failure but not every failure causes corruption in MR11. From what I observed it seems like any `CMD=1a` cause failures but no corruption while whenever there is a `CMD=0b` there is failure and corruption. Not sure what that might mean be but it is something I observed.
> 

No idea either.

> I then ran sleep and resume cycles with spd5118 disabled but still polling i2c devices and could not produce any errors, however this was just done via my desktop gui console so the script might be getting suspended before whatever it is in the sleep cycle that is causing this issue to occur.
> 

That is not surprising, as there is likely no other I2C device on that bus.

So we know that this only happens during suspend/resume. The corruption
seems to be happening exactly once per suspend/resume cycle, and hit
either the 0x1a read or the 0x0b read operation, but not both. To me this
still looks like there is an unprotected access to the I2C controller.

What log messages do you see when the system starts up ? Is there anything
along the line of "SMBus Host Controller at ..." or "Using register 0xXX for
SMBus port selection" ?

Also, is there any device at address 0x22 of bus 13 or 14 ?

Thanks,
Guenter

> 
> --- sleep/resume #1 ---
> [  179.066004] [   T3736] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [  179.066616] [   T3713] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [  179.068576] [   T3736] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] result=0
>              STEP 1 (PRE-START)    : CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=18
>              STEP 2 (START BIT SET): CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=18
>              STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=18
>              STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=00, DAT1=18
> [  179.068814] [   T3713] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [  179.068888] [   T3736] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> 
> --- sleep/resume #2 ---
> [  235.947153] [   T3700] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [  235.947827] [   T3699] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [  235.951600] [   T3700] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] result=0
>              STEP 1 (PRE-START)    : CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=00
>              STEP 2 (START BIT SET): CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=00
>              STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=00
>              STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=00
> [  235.955119] [   T3699] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [  235.955778] [   T3700] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x08
> 
> --- sleep/resume #3 ---
> [  298.628115] [   T3703] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [  298.629121] [   T3730] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [  298.631589] [   T3730] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] result=0
>              STEP 1 (PRE-START)    : CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=18
>              STEP 2 (START BIT SET): CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=18
>              STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18
>              STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18
> [  298.636234] [   T3703] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [  298.637812] [   T3730] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x08
> 
> --- sleep/resume #4 ---
> [  631.979533] [   T3021] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [  631.980193] [   T3017] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [  631.983008] [   T3021] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] result=0
>              STEP 1 (PRE-START)    : CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=18
>              STEP 2 (START BIT SET): CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=18
>              STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18
>              STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18
> [  631.985028] [   T3021] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [  631.987201] [   T3017] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> 
> --- sleep/resume #5 ---
> [ 1288.503455] [  T10850] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [ 1288.504462] [  T10813] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [ 1288.505927] [  T10850] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] result=0
>              STEP 1 (PRE-START)    : CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=18
>              STEP 2 (START BIT SET): CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=18
>              STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18
>              STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18
> [ 1288.511883] [  T10813] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [ 1288.512541] [  T10850] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x08
> 
> 
> --- sleep/resume #6 ---
> [ 1339.566042] [  T10863] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [ 1339.566679] [  T10887] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [ 1339.570157] [  T10887] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] result=0
>              STEP 1 (PRE-START)    : CNT=08, CMD=1a, ADD=a3, DAT0=00, DAT1=18
>              STEP 2 (START BIT SET): CNT=08, CMD=1a, ADD=a3, DAT0=00, DAT1=18
>              STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18
>              STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18
> [ 1339.572182] [  T10887] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [ 1339.573363] [  T10863] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> 
> --- piix4 transaction function ---
> int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short piix4_smba)
> {
>      int temp;
>      int result = 0;
>      int timeout = 0;
> 
>      dev_dbg(&piix4_adapter->dev, "Transaction (pre): CNT=%02x, CMD=%02x, "
>      "ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTCNT),
>              inb_p(SMBHSTCMD), inb_p(SMBHSTADD), inb_p(SMBHSTDAT0),
>              inb_p(SMBHSTDAT1));
> 
>      /* Register snapshot variables */
>      u8 pre_cnt, pre_cmd, pre_add, pre_dat0, pre_dat1;
>      u8 start_cnt, start_cmd, start_add, start_dat0, start_dat1;
>      u8 postwait_sts, postwait_cnt, postwait_cmd, postwait_add, postwait_dat0, postwait_dat1;
>      u8 post_cnt, post_cmd, post_add, post_dat0, post_dat1;
> 
>      /* Step 1: Read initial register state before starting */
>      pre_cnt  = inb_p(SMBHSTCNT);
>      pre_cmd  = inb_p(SMBHSTCMD);
>      pre_add  = inb_p(SMBHSTADD);
>      pre_dat0 = inb_p(SMBHSTDAT0);
>      pre_dat1 = inb_p(SMBHSTDAT1);
> 
>      /* Make sure the SMBus host is ready to start transmitting */
>      if ((temp = inb_p(SMBHSTSTS)) != 0x00) {
>          dev_dbg(&piix4_adapter->dev, "SMBus busy (%02x). Resetting...\n", temp);
>          outb_p(temp, SMBHSTSTS);
>          if ((temp = inb_p(SMBHSTSTS)) != 0x00) {
>              dev_err(&piix4_adapter->dev, "Failed! (%02x)\n", temp);
>              return -EBUSY;
>          }
>      }
> 
>      /* Start the transaction by setting bit 6 */
>      outb_p(inb(SMBHSTCNT) | 0x040, SMBHSTCNT);
> 
>      /* Step 2: Snapshot immediately after set start bit */
>      start_cnt  = inb_p(SMBHSTCNT);
>      start_cmd  = inb_p(SMBHSTCMD);
>      start_add  = inb_p(SMBHSTADD);
>      start_dat0 = inb_p(SMBHSTDAT0);
>      start_dat1 = inb_p(SMBHSTDAT1);
> 
>      /* Wait for transaction completion */
>      if (srvrworks_csb5_delay)
>          usleep_range(2000, 2100);
>      else
>          usleep_range(250, 500);
> 
>      while ((++timeout < MAX_TIMEOUT) &&
>          ((temp = inb_p(SMBHSTSTS)) & 0x01))
>          usleep_range(250, 500);
> 
>      /* Step 3: Snapshot right after wait loop */
>      postwait_sts  = temp;
>      postwait_cnt  = inb_p(SMBHSTCNT);
>      postwait_cmd  = inb_p(SMBHSTCMD);
>      postwait_add  = inb_p(SMBHSTADD);
>      postwait_dat0 = inb_p(SMBHSTDAT0);
>      postwait_dat1 = inb_p(SMBHSTDAT1);
> 
>      if (timeout == MAX_TIMEOUT)
>          result = -ETIMEDOUT;
>      if (temp & 0x10)
>          result = -EIO;
>      if (temp & 0x08)
>          result = -EIO;
>      if (temp & 0x04)
>          result = -ENXIO;
> 
>      if (inb_p(SMBHSTSTS) != 0x00)
>          outb_p(inb(SMBHSTSTS), SMBHSTSTS);
> 
>      /* Step 4: Final snapshot */
>      post_cnt  = inb_p(SMBHSTCNT);
>      post_cmd  = inb_p(SMBHSTCMD);
>      post_add  = inb_p(SMBHSTADD);
>      post_dat0 = inb_p(SMBHSTDAT0);
>      post_dat1 = inb_p(SMBHSTDAT1);
> 
>      /*
>       * Dump full diagnostic trace ONLY if:
>       * 1. Hardware registers were mutated (pre vs post mismatch on CMD or ADD)
>       * 2. The bus operation returned an error code
>       */
>      if (pre_cmd != post_cmd || pre_add != post_add || result != 0) {
>          dev_err(&piix4_adapter->dev,
>                  "[PIIX4 ERROR TRACE TRIGGERED] result=%d\n"
>                  "  STEP 1 (PRE-START)    : CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n"
>                  "  STEP 2 (START BIT SET): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n"
>                  "  STEP 3 (POST-WAIT)    : STS=%02x, CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n"
>                  "  STEP 4 (POST-CLEANUP) : CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
>                  result,
>                  pre_cnt, pre_cmd, pre_add, pre_dat0, pre_dat1,
>                  start_cnt, start_cmd, start_add, start_dat0, start_dat1,
>                  postwait_sts, postwait_cnt, postwait_cmd, postwait_add, postwait_dat0, postwait_dat1,
>                  post_cnt, post_cmd, post_add, post_dat0, post_dat1);
>      }
> 
>      if ((temp = inb_p(SMBHSTSTS)) != 0x00) {
>          dev_err(&piix4_adapter->dev, "Failed reset at end of "
>          "transaction (%02x)\n", temp);
>      }
>      dev_dbg(&piix4_adapter->dev, "Transaction (post): CNT=%02x, CMD=%02x, "
>      "ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTCNT),
>              inb_p(SMBHSTCMD), inb_p(SMBHSTADD), inb_p(SMBHSTDAT0),
>              inb_p(SMBHSTDAT1));
> 
>      return result;
> }
> 
> 
> Thanks,
> Matthew
> 
> On 9/1/26 12:04 PM, Guenter Roeck wrote:
>> Hi Matthew,
>>
>> On 9/1/26 09:31, Matthew Bettencourt wrote:
>>> Hello Guenter,
>>>
>>> I added additional logging into the piix4_transaction(). I will put the function call on the bottom. But as you guessed we are seeing not just MR11 corruption but also can trigger on other addresses as well. I was running the suspend/resume cycle and caught on both MR11 issue and else where. Here is the dmesg log output.
>>>
>>> --- Other PIIX4 transation ---
>> ...
>>> [29287.881787] [ T204580] i2c i2c-12: [PIIX4 REGISTER MUTATION DETECTED] Pre: (CMD=0x1a, ADD=0xa3) -> Post: (CMD=0x01, ADD=0x45) | DAT0=0xff
>> ...
>>> [29312.945873] [ T204570] i2c i2c-12: [PIIX4 REGISTER MUTATION DETECTED] Pre: (CMD=0x0b, ADD=0xa7) -> Post: (CMD=0x01, ADD=0x45) | DAT0=0xff
>>
>> It may be a coincidence, but the two failed accesses are exactly 25 seconds apart.
>>
>> Would it be possible to drop the messages except for the failures and run long-term
>> accesses (for example by reading the temperatures and/or the nvmem continuously) ?
>> You should find the nvmem at /sys/bus/nvmem/devices/0-005[13]/nvmem.
>>
>> It might be useful to know if this only happens during suspend/resume cycles
>> or if it happens all the time, if it happens randomly or in specific intervals,
>> and if the failure pattern is always the same.
>>
>> Thanks,
>> Guenter
>>
> 

