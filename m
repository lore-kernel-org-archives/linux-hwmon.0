Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EF81DE8AE
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Sep 2026 02:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788315245; cv=none; b=Gppys9+aaz1bSkuSSThx3YL6fQhpdzzzRs57nIJ4kE0CrAigYwjkhqE/j0aRosBSJ+9dH5utxeeRTZR9pWeOFZJz9QJGy61NNxS2hDu1cX86VCMTkz4PjHFTZlZEZV7EYmKOtqQv8lgESwtoAC6UNOc3F0csdRBI/9CLos6tfeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788315245; c=relaxed/simple;
	bh=RMIUFT7GxCPlE61iWUfdd9pulS+5GNj1hmVP1tvQYEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XFG+c0GPZXVi5cev2GVxT77EKjyyaUm+Ov7W2He2lysTvbgo7xBRerqvfvIGgoyjWgKPfVC2wo1BcjQ14LtnC7G5CRU5XziEiQegjlNN6cBymbTGr6UAbBeTZ7O2b9bja5nn2h/+dkdhZLos7wP1L8M9MMKuxD4VeDYs7NAYg6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egkKOMhU; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egkKOMhU"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cace91f112so4612735ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 19:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788315243; x=1788920043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uEa6Kd4q6on28jnIBrQdkgUeLxYJR7c+v9h+D3xPlJA=;
        b=egkKOMhUzRwyUrHbPy/1goczEqvN0c14238OG+PwDsid6ctDVwIf3RM5at0hGCKNg9
         QdTAe/j3dCnGImJhpVPRGjviGm7Dv/x0ncVYfZ0ji3WtQD1kGVm4pBg1GeNZFd4dpf6a
         k+E3JJ2C+nWcVF1V8x40+jz6raQ+41xPUeYMqpwLsC1PA7Yi88DDwoJ1B33OYr2LaZBZ
         IIfBYegdr7UnrKv6rruAH7I6og8AWaLy2NA+nKSmZtiTtuHcbUlv5skwQhJSQ6nS0I50
         J3L5GQeaZ3qTSLvoITx9RK26Hd3bbMMUgqG+1P6nod/tRNk/1g+7/q7zaheyrbk5FOTP
         2MrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788315243; x=1788920043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEa6Kd4q6on28jnIBrQdkgUeLxYJR7c+v9h+D3xPlJA=;
        b=dLkUVIohCDi2+dHEgOvx06AYU8Ml9R+SYcpIUBToHKpxrZvR1tSBz43X0J8jCV+3a1
         V88Iqbk5wsh0fWpWZprL47+8kEq5b2ZUJgg1r3/UmUoCHY1yO8hSUCmAMEgV84tCZi4H
         p5WI7wbc+zg113z2bOGG6M+Vc9TNXbzn3FLy0SH6kVvx2r47JQ41xuU8sUY5ZKG6BKI0
         lbLLL/dqS67NZMYuuutZ3bAhKkyHzetMwdt9xA8g6d77ek70GAYcHSK6n+XxYGw2hYTN
         fIXG8WeW38AXomAlkE/pq2X4byT/lwMD0q1F2xlp2H8enstdEJq43YLiJBf7i/Klmz5B
         nPSA==
X-Gm-Message-State: AFuF++mXclJ1QPLQ2FBE+EJBPfhDvINm4akiMV/wJDMCkcRjlkPsY5wg
	myPYD3DFtFKTb4wRKk2fpH47jPQq1rK/Hzm0Ux6NbIfoZbpIRuDY9N/WW7pe/y1M
X-Gm-Gg: AR+sD11oQkWq9Xv39fnfsZDttF+6qH0PBSyzXV+U7o3ltH+K0bPQEACAafasybpkEG9
	/3TUibv478G7NusQx862rXRIvAP01WoZJwsXbJUdBYScsf0PfkuU5Xoc+/4b8YWH7G3+TwckiP9
	TlIVxJWfA9iKECoqXOrFXF3Qrii5QE08p0s3SKMuq2L5HRLyD75oqV1kdjbkPjZyiJbO1dkxGw5
	GkjonG8wGnuyeNeH+dkOz4EsIRXGTMWEozedTiTBViDSADP6W7o8bMHEIJNPFi0+/D3W0z8eual
	NxsVnI4D0vdV9ExPOV8IM/sDxvsqpwF3B4hQEQ393Hq5QfilSuQvFQhGNqBo5B6qEYJffaKxeaq
	xnjg2eZXxghqQqFItojnmjvUigDuZJSt1JUZKpyOgzoygyLN+aRd2nDH4U+iRxXiosxIMRSNfby
	VJWW0T5PZpH1Pb2GfUb1dFG0DihmZO7RLO74/18ZL1TRgSbbkwmKZfpsoq93dSzz7O5B0LpRwrQ
	lxmWqdxqZvOLpH/8erLsMpIaSF/55k5F5UZ7WFc0JjPgjeqlPLvoXJ/vPDM
X-Received: by 2002:a17:903:388e:b0:2d9:49b3:abac with SMTP id d9443c01a7336-2daec7485demr22786395ad.18.1788315243350;
        Tue, 01 Sep 2026 19:14:03 -0700 (PDT)
Received: from [10.21.0.95] (wnpgmb0592w-ds02-161-177-131.dynamic.bellmts.net. [207.161.177.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd48898fsm5251345ad.39.2026.09.01.19.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 19:14:02 -0700 (PDT)
Message-ID: <65336f12-b821-449b-a637-31972807c676@gmail.com>
Date: Tue, 1 Sep 2026 21:14:01 -0500
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
To: Guenter Roeck <linux@roeck-us.net>
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
Content-Language: en-US
From: Matthew Bettencourt <matthew.bettencourt@gmail.com>
In-Reply-To: <67938f6d-d60f-44cf-9b03-fa472c8a8499@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Guetner,

I believe I implemented the print port correctly, below is the dmesg and 
piix4_sb800_port_sel() function.

 > Another idea might be to decode the ACPI data and see if there is 
anything
 > in there which accesses the SMBus controller.

I have no problem grabbing the ACPI data or whatever is needed, just 
might need a little bit of guidance on that front. I am OK at c code 
with some AI help but never really delved into ACPI.

And one last thing I greatly appreciate all the time and effort you are 
putting into this. I would definitely not have been able to get this far 
without your help.

--- CMD=0b
[19462.122064] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.123074] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.123109] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.124081] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.124115] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.125067] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.125074] [  T21668] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[19462.125094] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.126064] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.126072] [  T21683] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[19462.126088] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.127545] [  T21668] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] result=0
                         STEP 1 (PRE-START)    : CNT=08, CMD=0b, ADD=a7, 
DAT0=00, DAT1=18
                         STEP 2 (START BIT SET): CNT=08, CMD=0b, ADD=a7, 
DAT0=00, DAT1=18
                         STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, 
ADD=45, DAT0=ff, DAT1=18
                         STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, 
DAT0=ff, DAT1=18
[19462.127556] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.127582] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.128217] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.128240] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.128894] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.128920] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.129561] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.129588] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.130227] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.130255] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.130894] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.130919] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.131560] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.131584] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.132226] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.132249] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.132882] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.132904] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.133555] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.133563] [  T21683] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[19462.133581] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.134238] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19462.134244] [  T21668] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x08

--- CMD=1a
[19664.445821] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.446491] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.446531] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.447201] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.447235] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.447890] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.447903] [  T21712] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[19664.447923] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.448574] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.448581] [  T21668] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[19664.448601] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.449239] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.449264] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.449886] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.449910] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.451402] [  T21712] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] result=0
                             STEP 1 (PRE-START)    : CNT=08, CMD=1a, 
ADD=a7, DAT0=00, DAT1=18
                             STEP 2 (START BIT SET): CNT=08, CMD=1a, 
ADD=a7, DAT0=00, DAT1=18
                             STEP 3 (POST-WAIT)    : STS=00, CNT=08, 
CMD=01, ADD=45, DAT0=ff, DAT1=18
                             STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, 
ADD=45, DAT0=ff, DAT1=18
[19664.451414] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.451438] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.452398] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.452423] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.453393] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.453400] [  T21712] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[19664.453417] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.454396] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.454417] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.454883] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.454904] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.455541] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
hardware_was=0x00 | writing=0x07
[19664.455549] [  T21668] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00


---
int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
{
     u8 smba_en_lo, val, prev_port;

     if (mmio_cfg->use_mmio) {
         smba_en_lo = ioread8(mmio_cfg->addr + piix4_port_sel_sb800);
         val = (smba_en_lo & ~piix4_port_mask_sb800) | port;
         if (smba_en_lo != val)
             iowrite8(val, mmio_cfg->addr + piix4_port_sel_sb800);

         prev_port = smba_en_lo & piix4_port_mask_sb800;
     } else {
         outb_p(piix4_port_sel_sb800, SB800_PIIX4_SMB_IDX);
         smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);

         val = (smba_en_lo & ~piix4_port_mask_sb800) | port;
         if (smba_en_lo != val)
             outb_p(val, SB800_PIIX4_SMB_IDX + 1);

         prev_port = smba_en_lo & piix4_port_mask_sb800;
     }

     /* Always print port state on every function call */
     pr_info("piix4_smbus: PORT SEL -> requested=0x%02x | 
hardware_was=0x%02x | writing=0x%02x\n",
             port, prev_port, val);

     return prev_port;
}


Thanks,
Matthew
On 9/1/26 8:32 PM, Guenter Roeck wrote:
> On 9/1/26 17:57, Matthew Bettencourt wrote:
>> Hello Guenter,
>>
>> These are the only boot up messages I see for SMBus/i2c/piix4
>>
>> [    1.848113] [    T272] i2c_dev: i2c /dev entries driver
>> [    6.093885] [    T727] piix4_smbus 0000:00:14.0: SMBus Host 
>> Controller at 0xb00, revision 0
>> [    6.093888] [    T727] piix4_smbus 0000:00:14.0: Using register 
>> 0x02 for SMBus port selection
> 
> So bus 12 and 13 share the same controller address.
> 
> There is one more thing we can try: Print the selected port before and 
> after
> the access. The code to access the port number is in 
> piix4_sb800_port_sel().
> If we are "lucky", we may find that the selected port changed.
> 
> Unfortunately that isn't going to help much since we'd still have
> to figure out where that happens.
> 
> Another idea might be to decode the ACPI data and see if there is anything
> in there which accesses the SMBus controller.
> 
> Thanks,
> Guenter
> 
>> [    6.095020] [    T727] i2c i2c-12: Successfully instantiated SPD at 
>> 0x51
>> [    6.095981] [    T727] i2c i2c-12: Successfully instantiated SPD at 
>> 0x53
>> [    6.096039] [    T727] piix4_smbus 0000:00:14.0: Auxiliary SMBus 
>> Host Controller at 0xb20
>>
>>
>> I don't see anything on bus 13 or 14, I added 10-12 as well for good 
>> measure.
>> # sudo i2cdetect -y -a 14
>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>> 00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> # sudo i2cdetect -y -a 13
>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>> 00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> # sudo i2cdetect -y -a 12
>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>> 00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 10: -- -- -- -- -- 15 -- -- -- -- -- -- -- -- -- --
>> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 40: -- -- -- -- -- -- -- -- -- 49 -- 4b -- -- -- --
>> 50: -- 51 -- 53 -- -- -- -- -- -- -- -- -- -- -- --
>> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 70: -- 71 -- 73 -- -- -- -- -- -- -- -- -- -- 7e --
>> # sudo i2cdetect -y -a 11
>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>> 00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 30: 30 -- -- -- -- -- -- 37 -- -- -- -- -- -- -- --
>> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> # sudo i2cdetect -y -a 10
>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>> 00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>
>>
>>
>>
