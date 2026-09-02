Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4566B1B808
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Sep 2026 03:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788319159; cv=none; b=jSgX5devAtXL0bsMFPD24AKby0q04PLoqmaU0Hejd7pnKgwxarYt8PVOO4SmN7YvfhWVobMqI/TAdv3GwFgfn7rkDMvSXZgHcTQtJGsa5r+1B1yPSgQ5VV6bNnJawE6K1oQ78BeVK/sXUCRrHXTbDhKVT4jKbXKxPhQMLkWbpsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788319159; c=relaxed/simple;
	bh=J9MUzOHWD7OoDzQU2V53nULmFWYm/9f9z/ma4ic9aCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CSHb4HlGfEphB6kOAJgX47suN9nlKbD3Hgx57pbI9vrm18a4N4KpojdaItiJ6GLRGl1/p0EkluSHOmKkTQ3Vs30bUGj1NxOu99S3pWHSbKOgbZ2m9fAHzl5w2iGrGtj6JrX68wyd9PALU+wvCgttu7K9EQQ9IpthtMncYnDlYY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=owlwQoiE; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="owlwQoiE"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caced6038eso5509415ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 20:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788319157; x=1788923957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KUQb5H02f1dmCPABbAJYHoTH+Cpc/JKTQhBi7LTjf7U=;
        b=owlwQoiExyz++6rCoysGRKfftN7PMtNc31SCj+anEs3JT+v8XfzJDfJDX1fdVk1E8+
         SeDHLhWOeDPssbzAM8pibKRbHVCHMbkdyZ+3JIkHUVl9iIKphjhropkudfHjXxCOUjAd
         8doRt8eSJucr5Wh4yvm9wnT5LJhyd5TRGLYZPNLAuYqmUq0N/00/oKzOvERDpt07xvFq
         Gbd5kDuYXGjpX7/T4OYvXsQyFUooUC7oc16MTmlttBgzk+Rgi++GFqX719IiwAXlP7sA
         6k3OCVzprNngBw+JdqxTpvdx6CRou0bzVCiIo6NUDXCFx1MQqpwGacX5zTeO2+SqEboN
         9+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788319157; x=1788923957;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KUQb5H02f1dmCPABbAJYHoTH+Cpc/JKTQhBi7LTjf7U=;
        b=PsugAckFfrSXcDvO3uLif8+CitocZA2i6PXkTo1UNSyr+LXbogpBq5PZM7EsxhMBZU
         eFq5Ep0nclXtebCqyBcua4tBLNW8s2X8QdOhoQQyH9+lXPcWaTVJYQ5uDDxaRO87+vXK
         TkBjCgrcNe5rikR3BihT2brdszYGypLt5hij/J0mULEjlj93c7lXBi+MBDGFnpkkqlC2
         XvO/IGpEwkZfvqjotw3vMJDkn/8D9j/62rOlAP86XO0Iat9QNAw6swE3ZlPRoTPGrehP
         tD3IDjSjiP9ONJOxIa7YwEyxxlEXGU1k8SLodT50OKL8Su12TCH055idXD31vzCBc2ZQ
         V/Dg==
X-Gm-Message-State: AFuF++kKOGmCbtokeuwmy1lMRRj06aQpoNZFMQjsneV/NdiQvba90+aP
	H7aBqPuWU3d43u5qPGB9U8wKCxMvsdtGzctPy8fOrK7gfPX6U0Pz+/Rk
X-Gm-Gg: AYBFou3dzQN6pGRi51MHbAnGiUyXyVi9UlB2TQO7nRtSBRNXjd/6H3kl19fAZuNyCR0
	ZkGHpnXSxoV3Blm3jPDnmJAfIZgvXrn/V6BGUTYdKbq1vDefXyZe4P+uRXyDUWTp2cuP5PlXczb
	KUM3AxdUPhRKD0z299yqyJp9TvCVhJS98RidNWXWItg49yYK/Dp9C8Nl05nC3cJv50YhHOECUYY
	YEDzPHDvsDo4QVxCU1VyggtFURCIXpSU2ZTZlddqmy8+cYgocxc34iNeb7tMmNG68tlgi5eZDIR
	dCNLqcAHNzpf/ghTLYMwSChcsPmBBr/kH58NJdMbALb4KAMk9BZ8sWY8Xa4E5k319me2tHwKjsG
	NFwSGoQi5RSZlv0bnr18AYZJ9v49lBqg5f9L01DLbv2mo+bQn6M+92+1osZ88P9JhJyO7P9bShs
	V01ppgOyJ3k3AA20WqrX6EP0kJEcu38nNXuNdQoZzuiB993SOgfGBu6s6ThuJCy30ueytiKuhWt
	ax1V+E9CAW0w7LG7odMdrRYkoRbxnmmP2aWKA==
X-Received: by 2002:a17:902:e80f:b0:2d8:d4d2:d137 with SMTP id d9443c01a7336-2daf1383e43mr1043405ad.19.1788319156413;
        Tue, 01 Sep 2026 20:19:16 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dae62ed4a2sm3343335ad.22.2026.09.01.20.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 20:19:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a953dcaa-cfff-40c8-85a9-c12601e49e85@roeck-us.net>
Date: Tue, 1 Sep 2026 20:19:14 -0700
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
 <49cafd78-2468-4b43-a376-a8b2e2de2c19@roeck-us.net>
 <11de1daa-702e-419e-912a-db37c9f28e92@gmail.com>
 <67938f6d-d60f-44cf-9b03-fa472c8a8499@roeck-us.net>
 <65336f12-b821-449b-a637-31972807c676@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <65336f12-b821-449b-a637-31972807c676@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Matthew,

On 9/1/26 19:14, Matthew Bettencourt wrote:
> Hello Guetner,
> 
> I believe I implemented the print port correctly, below is the dmesg and piix4_sb800_port_sel() function.
> 
>  > Another idea might be to decode the ACPI data and see if there is anything
>  > in there which accesses the SMBus controller.
> 
> I have no problem grabbing the ACPI data or whatever is needed, just might need a little bit of guidance on that front. I am OK at c code with some AI help but never really delved into ACPI.
> 

It would be something like

sudo acpidump > acpi.log
acpixtract acpi.log
iasl -d *.dat

You'll get a number of.dsl files with cryptic assembler-style
code and data. Then the digging starts ... you may find something
like "Name (SMB0, 0x0B00)" in dsdt.dsl. Then we can only hope to
figure out if ACPI actually accesses it.

> And one last thing I greatly appreciate all the time and effort you are putting into this. I would definitely not have been able to get this far without your help.
> 
My pleasure.

> --- CMD=0b
> [19462.122064] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.123074] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.123109] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.124081] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.124115] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.125067] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.125074] [  T21668] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [19462.125094] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.126064] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.126072] [  T21683] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [19462.126088] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.127545] [  T21668] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] result=0
>                          STEP 1 (PRE-START)    : CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=18
>                          STEP 2 (START BIT SET): CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=18
>                          STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18
>                          STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18

Now we'll need to know the port number here (or even better at each step),
so some duplication of piix4_sb800_port_sel() which only reads the port
number will be needed.

Note that this may not help at all - whatever entity is modifying the registers
may not change the port number.

Thanks,
Guenter

> [19462.127556] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.127582] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.128217] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.128240] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.128894] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.128920] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.129561] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.129588] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.130227] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.130255] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.130894] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.130919] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.131560] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.131584] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.132226] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.132249] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.132882] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.132904] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.133555] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.133563] [  T21683] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [19462.133581] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.134238] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19462.134244] [  T21668] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x08
> 
> --- CMD=1a
> [19664.445821] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.446491] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.446531] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.447201] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.447235] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.447890] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.447903] [  T21712] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [19664.447923] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.448574] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.448581] [  T21668] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [19664.448601] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.449239] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.449264] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.449886] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.449910] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.451402] [  T21712] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] result=0
>                              STEP 1 (PRE-START)    : CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=18
>                              STEP 2 (START BIT SET): CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=18
>                              STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18
>                              STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18
> [19664.451414] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.451438] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.452398] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.452423] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.453393] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.453400] [  T21712] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> [19664.453417] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.454396] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.454417] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.454883] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.454904] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.455541] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | hardware_was=0x00 | writing=0x07
> [19664.455549] [  T21668] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
> 
> 
> ---
> int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
> {
>      u8 smba_en_lo, val, prev_port;
> 
>      if (mmio_cfg->use_mmio) {
>          smba_en_lo = ioread8(mmio_cfg->addr + piix4_port_sel_sb800);
>          val = (smba_en_lo & ~piix4_port_mask_sb800) | port;
>          if (smba_en_lo != val)
>              iowrite8(val, mmio_cfg->addr + piix4_port_sel_sb800);
> 
>          prev_port = smba_en_lo & piix4_port_mask_sb800;
>      } else {
>          outb_p(piix4_port_sel_sb800, SB800_PIIX4_SMB_IDX);
>          smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
> 
>          val = (smba_en_lo & ~piix4_port_mask_sb800) | port;
>          if (smba_en_lo != val)
>              outb_p(val, SB800_PIIX4_SMB_IDX + 1);
> 
>          prev_port = smba_en_lo & piix4_port_mask_sb800;
>      }
> 
>      /* Always print port state on every function call */
>      pr_info("piix4_smbus: PORT SEL -> requested=0x%02x | hardware_was=0x%02x | writing=0x%02x\n",
>              port, prev_port, val);
> 
>      return prev_port;
> }
> 
> 
> Thanks,
> Matthew
> On 9/1/26 8:32 PM, Guenter Roeck wrote:
>> On 9/1/26 17:57, Matthew Bettencourt wrote:
>>> Hello Guenter,
>>>
>>> These are the only boot up messages I see for SMBus/i2c/piix4
>>>
>>> [    1.848113] [    T272] i2c_dev: i2c /dev entries driver
>>> [    6.093885] [    T727] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
>>> [    6.093888] [    T727] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port selection
>>
>> So bus 12 and 13 share the same controller address.
>>
>> There is one more thing we can try: Print the selected port before and after
>> the access. The code to access the port number is in piix4_sb800_port_sel().
>> If we are "lucky", we may find that the selected port changed.
>>
>> Unfortunately that isn't going to help much since we'd still have
>> to figure out where that happens.
>>
>> Another idea might be to decode the ACPI data and see if there is anything
>> in there which accesses the SMBus controller.
>>
>> Thanks,
>> Guenter
>>
>>> [    6.095020] [    T727] i2c i2c-12: Successfully instantiated SPD at 0x51
>>> [    6.095981] [    T727] i2c i2c-12: Successfully instantiated SPD at 0x53
>>> [    6.096039] [    T727] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at 0xb20
>>>
>>>
>>> I don't see anything on bus 13 or 14, I added 10-12 as well for good measure.
>>> # sudo i2cdetect -y -a 14
>>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>>> 00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> # sudo i2cdetect -y -a 13
>>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>>> 00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> # sudo i2cdetect -y -a 12
>>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>>> 00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 10: -- -- -- -- -- 15 -- -- -- -- -- -- -- -- -- --
>>> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 40: -- -- -- -- -- -- -- -- -- 49 -- 4b -- -- -- --
>>> 50: -- 51 -- 53 -- -- -- -- -- -- -- -- -- -- -- --
>>> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 70: -- 71 -- 73 -- -- -- -- -- -- -- -- -- -- 7e --
>>> # sudo i2cdetect -y -a 11
>>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>>> 00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 30: 30 -- -- -- -- -- -- 37 -- -- -- -- -- -- -- --
>>> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> # sudo i2cdetect -y -a 10
>>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>>> 00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>> 70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>
>>>
>>>
>>>
> 

