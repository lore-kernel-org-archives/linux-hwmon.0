Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9778A2F7EE4
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Sep 2026 14:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357630; cv=none; b=U1fWDxqEVxwSyxIISZTjndadVrGXcJdMq165XKYPNRbtA2VGwOScPcIILfNYY6tXU44NkpS1FMRmRlk14P6Aul5ZxcHkk/pXAxqIf2zkwoHKWmcOSIyfbyTcPFa5/qXvHy8OicXHEvRu0Wth3spKpyjMYuy0rMrP71p75lioH3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357630; c=relaxed/simple;
	bh=6LVWTeWgZlck/4usw9EWlpzTB8MdLUqdBszKfJQ/sUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ilzmXub+s1zK46aYNz5eODB2RPkC061wHq3heT3tKyK7jDt/XnWxu8QDZ0uFdO+VM0nGTHaO25zVmPVgbxc0EKDJKYJnOurbpDwuQDNeQh32TYOJ3usf/zPSjdBLxSye2KUrdXsbRtSUIo3jF3Yfgir94295ZDybYD/5EoR2VE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jd9h/nC5; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jd9h/nC5"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d91ded8174so9243015ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Sep 2026 07:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788357628; x=1788962428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gm8ITZCDQPfDReHPfDmaMUoSunWxAvkTDKJ9sEulIO4=;
        b=jd9h/nC5r3GJqj7m9zipVMP3fUXtRM5233zueaV4SQWsnRO17S+S7mzkhNle+ki1M2
         FHvvGaTTYlVDAUtxSJkG8HQU9HvXV/L9xo5emQpGgZmqjfqKHRsJS6GC8Y7aFjFgkjH/
         TL98badrCY5az5nhktoxgt9MaMfU6ava/dnSpuE/zmNjGRDkXt2PhBYj7xSF7egtQs7x
         +XkAQrIfxpVyYWq3YL2F7PvUyIs17CxoplOUKKhdzs4KBnxmWrwjEhVoRQkRpGzpYeLx
         H6sEzBNDkocRYFerzywnqjWLi3Q0aydCrjWP148291ZoU8OQU2ofgqqO7M9rE9NlIYfO
         0KhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788357628; x=1788962428;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gm8ITZCDQPfDReHPfDmaMUoSunWxAvkTDKJ9sEulIO4=;
        b=aDRX+j3kQpOGXa3jjOz76jSFizSoNR6fzPpA6hSpqsEFiAeNc0uscGg25vylPzYgRt
         uB+1DBl4+Bvgu5XOS012LBVneClqwE16Cpz620V0CvPzHe6jYorfHKtnAN+VUFXL22it
         DtRMK9Mke7EXZ7PxPkOwdosqL9g7BNzDOe2DIgaF/iAQqK0Ae7vFipWmS3Q3Te+/hIO1
         cbdZhU98tW/tou2xR6MYFnTNgsFyIrsETWk3UXDquxK4q6y0ai1sD3UBSRf2DXhEMsdY
         dBtWhwET9FwJUcdth8OUc7sSyXXkwOUI5yN/qRX7rCBixOTgJhR45lolMp6bCdFq33wK
         +9cA==
X-Gm-Message-State: AFuF++kBHVCZ8RBfznxHhaJReDRHKGgNWaamQfZg8ne5e3A4uxXWTVoU
	Qf4juCm35atzsxQFX+LiSjEHINRI0MlXdM2Hopu17iCZkm5OkI/fCoOLB4Fq5gVj
X-Gm-Gg: AYBFou2kjXwRbZIKatNZ6QJQSmwxQZ0kxtysq2ggLXoahp1wS1+idyU4eD2MvOPPNku
	x2zs2YUOrOgaBKPgwzb1S5Jnjn9gKM1KxOLBQmE+81NaMfmdcU00X4RTVx+nhZKFGzrryCGm+LA
	Fw7Rn5OGIb00XW7gZBXr/V1gWzqtTIIP79pdbHct91LcFuczPjzMMdtUeVdYbjGrmbyqiHlxGNE
	fuNhawUj+NUVSIozk9uDBQ0Nb45wF5yxxUR4BtM5sIn0ZOnLC4v1UhE96Cfiq+MZDE5E/mqHHUK
	K0hwVybDMxs2BkPdhxaIl9Ac0jN4NgJzWA5PxHm3DnkpxHZa9PVq0kgnhau51CZYkoQS62uNrhg
	fkl7xwIfI7hxVPPGCpXUWJE9EEcFP5YUQ+9kb4yLL1N9uO0Gk5DEWVac8k2N+y+oFsvVJC15zaR
	ZTOcf17t/GonCRpERFWXc2wOB7UgTqT2pB4Vq8lOq7IuJq79hluY0LAEEsdPEVrLLPQNBX+/hdN
	BFRxLE3uspHBjunOYKkeL8xGoct2sQlcc+/LYKvzm1IRD1DRquuehOO
X-Received: by 2002:a17:902:ef0a:b0:2d3:160b:c01f with SMTP id d9443c01a7336-2daec636360mr74024015ad.6.1788357627189;
        Wed, 02 Sep 2026 07:00:27 -0700 (PDT)
Received: from [10.198.0.120] (wnpgmb02ydw-ds01-112-62-45.dynamic.bellmts.net. [204.112.62.45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd488d18sm13684255ad.45.2026.09.02.07.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 07:00:26 -0700 (PDT)
Message-ID: <9cdf4b63-8f99-4a80-b0be-3f3df69e526e@gmail.com>
Date: Wed, 2 Sep 2026 09:00:24 -0500
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
 <65336f12-b821-449b-a637-31972807c676@gmail.com>
 <a953dcaa-cfff-40c8-85a9-c12601e49e85@roeck-us.net>
Content-Language: en-US
From: Matthew Bettencourt <matthew.bettencourt@gmail.com>
In-Reply-To: <a953dcaa-cfff-40c8-85a9-c12601e49e85@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Guenter,

 > It would be something like
 >
 > sudo acpidump > acpi.log
 > acpixtract acpi.log
 > iasl -d *.dat
 >
 > You'll get a number of.dsl files with cryptic assembler-style
 > code and data. Then the digging starts ... you may find something
 > like "Name (SMB0, 0x0B00)" in dsdt.dsl. Then we can only hope to
 > figure out if ACPI actually accesses it.

That wasn't as hard as I thought. I got everything decoding I guess, I 
just did a grep on all the dsl files for SMB.

$ grep -i -rn "SMB" *.dsl
dsdt.dsl:295:    Name (SMBB, 0x0B20)
dsdt.dsl:296:    Name (SMBL, 0x20)
dsdt.dsl:297:    Name (SMB0, 0x0B00)
dsdt.dsl:298:    Name (SMBM, 0x10)
dsdt.dsl:311:    Name (SSMB, 0xFED80200)
dsdt.dsl:3352:                                If (SMBB)
dsdt.dsl:3354:                                    CreateWordField (CRS, 
0xD2, SMB1)
dsdt.dsl:3357:                                    SMB1 = SMBB /* \SMBB */
dsdt.dsl:3358:                                    SMH1 = SMBB /* \SMBB */
dsdt.dsl:3359:                                    SML1 = SMBL /* \SMBL */
dsdt.dsl:3360:                                    CreateWordField (CRS, 
0xCA, SMBZ)
dsdt.dsl:3363:                                    SMBZ = SMB0 /* \SMB0 */
dsdt.dsl:3364:                                    SMH0 = SMB0 /* \SMB0 */
dsdt.dsl:3365:                                    SML0 = SMBM /* \SMBM */
ssdt4.dsl:4026:            SMB8,   8
ssdt4.dsl:4032:            SMB8 |= 0x40
ssdt4.dsl:4046:            Local1 = SMB8 /* \M477.SMB8 */
ssdt4.dsl:4062:            SMB8,   8
ssdt4.dsl:4065:        SMB8 |= 0x80
ssdt4.dsl:4073:            SMB0,   8,
ssdt4.dsl:4074:            SMB1,   8,
ssdt4.dsl:4075:            SMB2,   8
ssdt4.dsl:4085:                SMB0 = 0x1F
ssdt4.dsl:4100:                Local2 = SMB0 /* \M479.SMB0 */
ssdt4.dsl:4105:                SMB2 = 0x02
ssdt4.dsl:4113:        If (((SMB0 & One) != Zero))
ssdt4.dsl:4124:                SMB1 = 0x3F
ssdt4.dsl:4139:                Local2 = SMB1 /* \M479.SMB1 */
ssdt4.dsl:4144:                SMB1 = 0x02
ssdt4.dsl:4152:        If (((SMB1 & One) != Zero))
ssdt4.dsl:4173:        M460 ("  KER-ASL-CpmSmbusExecutor (Port%d, isRead 
%d, Potcl %d, DevAddr 0x%X, Cmd 0x%X)\n", Arg0, Arg1, Arg2, Arg3, Arg4, 
Zero)
ssdt4.dsl:4179:            M459 ("  KER-ASL-CpmSmbusExecutor return 
0x80\n", Zero)
ssdt4.dsl:4186:            M459 ("  KER-ASL-CpmSmbusExecutor return 
0x81\n", Zero)
ssdt4.dsl:4201:            M459 ("  KER-ASL-CpmSmbusExecutor return 
0x82\n", Zero)
ssdt4.dsl:4212:                M460 ("  KER-ASL-CpmSmbusExecutor return 
0x83, Length %d\n", Local2, Zero, Zero, Zero, Zero, Zero)
ssdt4.dsl:4223:            M460 ("  KER-ASL-CpmSmbusExecutor return 
0x84, Local4 %d\n", Local4, Zero, Zero, Zero, Zero, Zero)
ssdt4.dsl:4230:            SMB0,   8,
ssdt4.dsl:4231:            SMB1,   8,
ssdt4.dsl:4232:            SMB2,   8,
ssdt4.dsl:4233:            SMB3,   8,
ssdt4.dsl:4234:            SMB4,   8,
ssdt4.dsl:4235:            SMB5,   8,
ssdt4.dsl:4236:            SMB6,   8,
ssdt4.dsl:4237:            SMB7,   8,
ssdt4.dsl:4238:            SMB8,   8
ssdt4.dsl:4249:            Local6 = SMB2 /* \M47A.SMB2 */
ssdt4.dsl:4250:            SMB2 = (Local6 & 0x7F)
ssdt4.dsl:4257:                SMB2 = Local6
ssdt4.dsl:4267:            M459 ("  KER-ASL-CpmSmbusExecutor return 
0x85\n", Zero)
ssdt4.dsl:4275:                SMB2 = Local6
ssdt4.dsl:4286:            M459 ("  KER-ASL-CpmSmbusExecutor return 
0x86\n", Zero)
ssdt4.dsl:4294:            SMB0 = 0x1F
ssdt4.dsl:4295:            SMB4 = ((Arg3 << One) | Arg1)
ssdt4.dsl:4296:            SMB3 = Arg4
ssdt4.dsl:4297:            SMB2 = (Arg2 << 0x02)
ssdt4.dsl:4298:            Local1 = SMB2 /* \M47A.SMB2 */
ssdt4.dsl:4303:                    SMB5 = DerefOf (Local7 [One])
ssdt4.dsl:4308:                    SMB6 = DerefOf (Local7 [0x02])
ssdt4.dsl:4309:                    SMB5 = DerefOf (Local7 [One])
ssdt4.dsl:4315:                    SMB5 = Local2
ssdt4.dsl:4319:                        SMB7 = DerefOf (Local7 [Local1])
ssdt4.dsl:4327:                SMB5 = Local2
ssdt4.dsl:4330:            SMB2 = ((Arg2 << 0x02) | 0x40)
ssdt4.dsl:4350:                Local2 = SMB0 /* \M47A.SMB0 */
ssdt4.dsl:4355:                SMB2 = 0x02
ssdt4.dsl:4358:                    SMB2 = Local6
ssdt4.dsl:4369:                M459 ("  KER-ASL-CpmSmbusExecutor return 
0x87\n", Zero)
ssdt4.dsl:4379:                SMB0 = 0x08
ssdt4.dsl:4390:                        DATB = SMB5 /* \M47A.SMB5 */
ssdt4.dsl:4396:                        Local0 [0x03] = SMB6 /* \M47A.SMB6 */
ssdt4.dsl:4397:                        Local0 [0x02] = SMB5 /* \M47A.SMB5 */
ssdt4.dsl:4403:                        Local2 = SMB2 /* \M47A.SMB2 */
ssdt4.dsl:4404:                        Local2 = SMB5 /* \M47A.SMB5 */
ssdt4.dsl:4416:                            Local0 [Local1] = SMB7 /* 
\M47A.SMB7 */
ssdt4.dsl:4424:        Local1 = (SMB0 & 0x1D)
ssdt4.dsl:4426:        SMB0 = 0x1F
ssdt4.dsl:4429:            SMB2 = Local6
ssdt4.dsl:4439:        M460 ("  KER-ASL-CpmSmbusExecutor return St: 
0x%X, Len %d, Data: 0x%X, 0x%X, 0x%X, 0x%X ...\n", STAT, LEN, DerefOf 
(Local0 [0x02]), DerefOf (Local0 [
ssdt4.dsl:4497:            M460 ("  KER-ASL-CpmReadSmbusByte (%d, 0x%X, 
0x%X) = 0 Smbus Access Disable\n", Arg0, Arg1, Arg2, Zero, Zero, Zero)
ssdt4.dsl:4506:            SMB0,   8,
ssdt4.dsl:4507:            SMB1,   8,
ssdt4.dsl:4508:            SMB2,   8,
ssdt4.dsl:4509:            SMB3,   8,
ssdt4.dsl:4510:            SMB4,   8,
ssdt4.dsl:4511:            SMB5,   8,
ssdt4.dsl:4512:            SMB6,   8,
ssdt4.dsl:4513:            SMB7,   8,
ssdt4.dsl:4514:            SMB8,   8
ssdt4.dsl:4525:            Local6 = SMB2 /* \M409.SMB2 */
ssdt4.dsl:4526:            SMB2 = (Local6 & 0x7F)
ssdt4.dsl:4533:            SMB8 |= 0x10
ssdt4.dsl:4536:            Local1 = SMB8 /* \M409.SMB8 */
ssdt4.dsl:4546:                SMB0 = 0x1F
ssdt4.dsl:4549:                Local1 = SMB0 /* \M409.SMB0 */
ssdt4.dsl:4554:                SMB2 = 0x02
ssdt4.dsl:4567:                SMB2 = Local6
ssdt4.dsl:4576:            M460 ("  KER-ASL-CpmReadSmbusByte (%d, 0x%X, 
0x%X) = 0 ERROR 1\n", Arg0, Arg1, Arg2, Zero, Zero, Zero)
ssdt4.dsl:4587:                SMB1 = 0x3F
ssdt4.dsl:4590:                Local1 = SMB1 /* \M409.SMB1 */
ssdt4.dsl:4595:                SMB1 = 0x02
ssdt4.dsl:4608:                SMB2 = Local6
ssdt4.dsl:4617:            M460 ("  KER-ASL-CpmReadSmbusByte (%d, 0x%X, 
0x%X) = 0 ERROR 2\n", Arg0, Arg1, Arg2, Zero, Zero, Zero)
ssdt4.dsl:4624:            SMB0 = 0x1F
ssdt4.dsl:4625:            SMB4 = ((Arg1 << One) | One)
ssdt4.dsl:4626:            SMB3 = Arg2
ssdt4.dsl:4627:            SMB2 = 0x08
ssdt4.dsl:4628:            Local1 = SMB2 /* \M409.SMB2 */
ssdt4.dsl:4629:            SMB2 = 0x48
ssdt4.dsl:4639:                    Local1 = SMB0 /* \M409.SMB0 */
ssdt4.dsl:4644:                    SMB2 = 0x02
ssdt4.dsl:4647:                        SMB2 = Local6
ssdt4.dsl:4656:                    M460 ("  KER-ASL-CpmReadSmbusByte 
(%d, 0x%X, 0x%X) = 0 ERROR 3\n", Arg0, Arg1, Arg2, Zero, Zero, Zero)
ssdt4.dsl:4662:                Local1 = SMB0 /* \M409.SMB0 */
ssdt4.dsl:4672:                SMB0 = 0x08
ssdt4.dsl:4679:                Local4 = SMB5 /* \M409.SMB5 */
ssdt4.dsl:4683:        SMB0 = 0x1F
ssdt4.dsl:4684:        SMB8 |= 0x20
ssdt4.dsl:4687:            SMB2 = Local6
ssdt4.dsl:4696:        M460 ("  KER-ASL-CpmReadSmbusByte (%d, 0x%X, 
0x%X) = 0x%X Success\n", Arg0, Arg1, Arg2, Local4, Zero, Zero)
ssdt4.dsl:4705:            M460 ("  KER-ASL-CpmWriteSmbusByte (%d, 0x%X, 
0x%X, 0x%X) = 0 Smbus Access Disable\n", Arg0, Arg1, Arg2, Arg3, Zero, Zero)
ssdt4.dsl:4714:            SMB0,   8,
ssdt4.dsl:4715:            SMB1,   8,
ssdt4.dsl:4716:            SMB2,   8,
ssdt4.dsl:4717:            SMB3,   8,
ssdt4.dsl:4718:            SMB4,   8,
ssdt4.dsl:4719:            SMB5,   8,
ssdt4.dsl:4720:            SMB6,   8,
ssdt4.dsl:4721:            SMB7,   8,
ssdt4.dsl:4722:            SMB8,   8
ssdt4.dsl:4733:            Local6 = SMB2 /* \M410.SMB2 */
ssdt4.dsl:4734:            SMB2 = (Local6 & 0x7F)
ssdt4.dsl:4741:            SMB8 |= 0x10
ssdt4.dsl:4744:            Local1 = SMB8 /* \M410.SMB8 */
ssdt4.dsl:4754:                SMB0 = 0x1F
ssdt4.dsl:4757:                Local1 = SMB0 /* \M410.SMB0 */
ssdt4.dsl:4762:                SMB2 = 0x02
ssdt4.dsl:4775:                SMB2 = Local6
ssdt4.dsl:4784:            M460 ("  KER-ASL-CpmWriteSmbusByte (%d, 0x%X, 
0x%X, 0x%X) = 0 ERROR 1\n", Arg0, Arg1, Arg2, Arg3, Zero, Zero)
ssdt4.dsl:4795:                SMB1 = 0x3F
ssdt4.dsl:4798:                Local1 = SMB1 /* \M410.SMB1 */
ssdt4.dsl:4803:                SMB1 = 0x02
ssdt4.dsl:4816:                SMB2 = Local6
ssdt4.dsl:4825:            M460 ("  KER-ASL-CpmWriteSmbusByte (%d, 0x%X, 
0x%X, 0x%X) = 0 ERROR 2\n", Arg0, Arg1, Arg2, Arg3, Zero, Zero)
ssdt4.dsl:4832:            SMB0 = 0x1F
ssdt4.dsl:4833:            SMB4 = (Arg1 << One)
ssdt4.dsl:4834:            SMB3 = Arg2
ssdt4.dsl:4835:            SMB2 = 0x08
ssdt4.dsl:4836:            Local1 = SMB2 /* \M410.SMB2 */
ssdt4.dsl:4837:            SMB5 = Arg3
ssdt4.dsl:4838:            SMB2 = 0x48
ssdt4.dsl:4848:                    Local1 = SMB0 /* \M410.SMB0 */
ssdt4.dsl:4853:                    SMB2 = 0x02
ssdt4.dsl:4856:                        SMB2 = Local6
ssdt4.dsl:4865:                    M460 ("  KER-ASL-CpmWriteSmbusByte 
(%d, 0x%X, 0x%X, 0x%X) = 0 ERROR 3\n", Arg0, Arg1, Arg2, Arg3, Zero, Zero)
ssdt4.dsl:4871:                Local1 = SMB0 /* \M410.SMB0 */
ssdt4.dsl:4881:                SMB0 = 0x08
ssdt4.dsl:4892:        SMB0 = 0x1F
ssdt4.dsl:4893:        SMB8 |= 0x20
ssdt4.dsl:4896:            SMB2 = Local6
ssdt4.dsl:4905:        M460 ("  KER-ASL-CpmWriteSmbusByte (%d, 0x%X, 
0x%X, 0x%X) Success\n", Arg0, Arg1, Arg2, Arg3, Zero, Zero)


On 9/1/26 10:19 PM, Guenter Roeck wrote:
> Hi Matthew,
> 
> On 9/1/26 19:14, Matthew Bettencourt wrote:
>> Hello Guetner,
>>
>> I believe I implemented the print port correctly, below is the dmesg 
>> and piix4_sb800_port_sel() function.
>>
>>  > Another idea might be to decode the ACPI data and see if there is 
>> anything
>>  > in there which accesses the SMBus controller.
>>
>> I have no problem grabbing the ACPI data or whatever is needed, just 
>> might need a little bit of guidance on that front. I am OK at c code 
>> with some AI help but never really delved into ACPI.
>>
> 
> It would be something like
> 
> sudo acpidump > acpi.log
> acpixtract acpi.log
> iasl -d *.dat
> 
> You'll get a number of.dsl files with cryptic assembler-style
> code and data. Then the digging starts ... you may find something
> like "Name (SMB0, 0x0B00)" in dsdt.dsl. Then we can only hope to
> figure out if ACPI actually accesses it.
> 
>> And one last thing I greatly appreciate all the time and effort you 
>> are putting into this. I would definitely not have been able to get 
>> this far without your help.
>>
> My pleasure.
> 
>> --- CMD=0b
>> [19462.122064] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.123074] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.123109] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.124081] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.124115] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.125067] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.125074] [  T21668] spd5118 12-0053: PRE BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [19462.125094] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.126064] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.126072] [  T21683] spd5118 12-0051: PRE BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [19462.126088] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.127545] [  T21668] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] 
>> result=0
>>                          STEP 1 (PRE-START)    : CNT=08, CMD=0b, 
>> ADD=a7, DAT0=00, DAT1=18
>>                          STEP 2 (START BIT SET): CNT=08, CMD=0b, 
>> ADD=a7, DAT0=00, DAT1=18
>>                          STEP 3 (POST-WAIT)    : STS=00, CNT=08, 
>> CMD=01, ADD=45, DAT0=ff, DAT1=18
>>                          STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, 
>> ADD=45, DAT0=ff, DAT1=18
> 
> Now we'll need to know the port number here (or even better at each step),
> so some duplication of piix4_sb800_port_sel() which only reads the port
> number will be needed.
> 
> Note that this may not help at all - whatever entity is modifying the 
> registers
> may not change the port number.
> 
> Thanks,
> Guenter
> 
>> [19462.127556] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.127582] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.128217] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.128240] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.128894] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.128920] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.129561] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.129588] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.130227] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.130255] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.130894] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.130919] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.131560] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.131584] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.132226] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.132249] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.132882] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.132904] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.133555] [  T21683] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.133563] [  T21683] spd5118 12-0051: POST BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [19462.133581] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.134238] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19462.134244] [  T21668] spd5118 12-0053: POST BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x08
>>
>> --- CMD=1a
>> [19664.445821] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.446491] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.446531] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.447201] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.447235] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.447890] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.447903] [  T21712] spd5118 12-0053: PRE BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [19664.447923] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.448574] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.448581] [  T21668] spd5118 12-0051: PRE BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [19664.448601] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.449239] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.449264] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.449886] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.449910] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.451402] [  T21712] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] 
>> result=0
>>                              STEP 1 (PRE-START)    : CNT=08, CMD=1a, 
>> ADD=a7, DAT0=00, DAT1=18
>>                              STEP 2 (START BIT SET): CNT=08, CMD=1a, 
>> ADD=a7, DAT0=00, DAT1=18
>>                              STEP 3 (POST-WAIT)    : STS=00, CNT=08, 
>> CMD=01, ADD=45, DAT0=ff, DAT1=18
>>                              STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, 
>> ADD=45, DAT0=ff, DAT1=18
>> [19664.451414] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.451438] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.452398] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.452423] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.453393] [  T21712] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.453400] [  T21712] spd5118 12-0053: POST BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>> [19664.453417] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.454396] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.454417] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.454883] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.454904] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.455541] [  T21668] piix4_smbus: PORT SEL -> requested=0x00 | 
>> hardware_was=0x00 | writing=0x07
>> [19664.455549] [  T21668] spd5118 12-0051: POST BIT UPDATE: SUSPEND 
>> MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>
>>
>> ---
>> int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
>> {
>>      u8 smba_en_lo, val, prev_port;
>>
>>      if (mmio_cfg->use_mmio) {
>>          smba_en_lo = ioread8(mmio_cfg->addr + piix4_port_sel_sb800);
>>          val = (smba_en_lo & ~piix4_port_mask_sb800) | port;
>>          if (smba_en_lo != val)
>>              iowrite8(val, mmio_cfg->addr + piix4_port_sel_sb800);
>>
>>          prev_port = smba_en_lo & piix4_port_mask_sb800;
>>      } else {
>>          outb_p(piix4_port_sel_sb800, SB800_PIIX4_SMB_IDX);
>>          smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
>>
>>          val = (smba_en_lo & ~piix4_port_mask_sb800) | port;
>>          if (smba_en_lo != val)
>>              outb_p(val, SB800_PIIX4_SMB_IDX + 1);
>>
>>          prev_port = smba_en_lo & piix4_port_mask_sb800;
>>      }
>>
>>      /* Always print port state on every function call */
>>      pr_info("piix4_smbus: PORT SEL -> requested=0x%02x | 
>> hardware_was=0x%02x | writing=0x%02x\n",
>>              port, prev_port, val);
>>
>>      return prev_port;
>> }
>>
>>
>> Thanks,
>> Matthew
>> On 9/1/26 8:32 PM, Guenter Roeck wrote:
>>> On 9/1/26 17:57, Matthew Bettencourt wrote:
>>>> Hello Guenter,
>>>>
>>>> These are the only boot up messages I see for SMBus/i2c/piix4
>>>>
>>>> [    1.848113] [    T272] i2c_dev: i2c /dev entries driver
>>>> [    6.093885] [    T727] piix4_smbus 0000:00:14.0: SMBus Host 
>>>> Controller at 0xb00, revision 0
>>>> [    6.093888] [    T727] piix4_smbus 0000:00:14.0: Using register 
>>>> 0x02 for SMBus port selection
>>>
>>> So bus 12 and 13 share the same controller address.
>>>
>>> There is one more thing we can try: Print the selected port before 
>>> and after
>>> the access. The code to access the port number is in 
>>> piix4_sb800_port_sel().
>>> If we are "lucky", we may find that the selected port changed.
>>>
>>> Unfortunately that isn't going to help much since we'd still have
>>> to figure out where that happens.
>>>
>>> Another idea might be to decode the ACPI data and see if there is 
>>> anything
>>> in there which accesses the SMBus controller.
>>>
>>> Thanks,
>>> Guenter
>>>
>>>> [    6.095020] [    T727] i2c i2c-12: Successfully instantiated SPD 
>>>> at 0x51
>>>> [    6.095981] [    T727] i2c i2c-12: Successfully instantiated SPD 
>>>> at 0x53
>>>> [    6.096039] [    T727] piix4_smbus 0000:00:14.0: Auxiliary SMBus 
>>>> Host Controller at 0xb20
>>>>
>>>>
>>>> I don't see anything on bus 13 or 14, I added 10-12 as well for good 
>>>> measure.
>>>> # sudo i2cdetect -y -a 14
>>>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>>>> 00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> # sudo i2cdetect -y -a 13
>>>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>>>> 00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> # sudo i2cdetect -y -a 12
>>>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>>>> 00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 10: -- -- -- -- -- 15 -- -- -- -- -- -- -- -- -- --
>>>> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 40: -- -- -- -- -- -- -- -- -- 49 -- 4b -- -- -- --
>>>> 50: -- 51 -- 53 -- -- -- -- -- -- -- -- -- -- -- --
>>>> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 70: -- 71 -- 73 -- -- -- -- -- -- -- -- -- -- 7e --
>>>> # sudo i2cdetect -y -a 11
>>>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>>>> 00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 30: 30 -- -- -- -- -- -- 37 -- -- -- -- -- -- -- --
>>>> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> # sudo i2cdetect -y -a 10
>>>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>>>> 00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>> 70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>>>
>>>>
>>>>
>>>>
>>
> 

