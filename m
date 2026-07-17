Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613DF3DCDBF
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Jul 2026 08:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784275254; cv=none; b=r0mT85ZlwyzjOtgjIOFfqx1jzHpSSW5hL2RGP5oO8LCwqPLjVXx0tMpXNU/nRxQkWO+g0+YxsZUm49NH9avOI+HUP1BugcMD5cNWmrLrl4Y90Of0qEaAtzoBqjuXkL4Fyeb3O7zHnyAFnvmQULVu6d7D3yPHsDxxUZ5ynqX9iS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784275254; c=relaxed/simple;
	bh=5TK5+A8l3/UCcWk86OmEsOO2M+0k4ZunqEhdaKTEsqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZBxgPCqY1kh+1DjmtEnK3+TbXWg4gcrEmLvbp/okH8KPzxu9QcM58z17kXbC8uI7vVCvkxIpxA1tpg4cIo176GikewUfLE5k8uhTcjCwsW8e0pRSKkWBQo9f7S7sqbyWwXMxaDUiumiFPiSvod7nxZ/eaIdU/09Qy/nx6xocwBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsNmJaqn; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsNmJaqn"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47de008b020so969613f8f.1
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Jul 2026 01:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784275250; x=1784880050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g5XOjj3wvMb//AUkLm3Blkifr6hBS1t4fksNlwiTW34=;
        b=CsNmJaqnfu/0TM4wOnDaumnRMl0RxuM5NopLvfNwONGrctFhLphkH3UYE6VMXGgS2F
         2lESpy+Jy0jdGU2jXInvOAviZdOdXxjs2yP4N6w4dtsUWTgR1CpdXUMIsavI2x5Q3MfM
         OLI7TedGhGTSAQu8l44RGLSNzIFJ9ypjk49L4GDKBaugMvTndJbc/0TEi6jsPHSM1ffv
         IEHLb5n4Q/C25szQYOVpcaJ0WsAYqpvMQtSaXzS1jWx7aq1gDzibnDI5hF2C8im1oEMU
         bTINXsbDgJQiwtFB2u5tfANrDqRPHWrsplnsW/KMs+m5pdPMookCNQjidCvdxqCb2fYk
         u1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784275250; x=1784880050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g5XOjj3wvMb//AUkLm3Blkifr6hBS1t4fksNlwiTW34=;
        b=d+iHBRPNDgThVZJHOp+FxP97uZdCf38Nq74G0h69oIvkX4+17W1bqOG41lSmuED9CB
         AvwuA6z2OjLzQmavmDZ3rv473X5TcXMyBiDs7/gNgAwIJVbD2Phfee1xp4Fri/d70CrI
         c60+O+iQxIu0IPtFujh/OhwQXJzje/kDuIs1HxHW9PNGNdA75TOgrtjRsLNPkjP9tTS4
         4X53vdEq+uZh9Va6OVgmg+8zv08nKsS51QyQw7bDBC0GWW0SxcgAQAWk5ctSGdplntYr
         0ewXfWA9MCz11cr2Q3AJ0oDtjePkZwDyCAwvtOKV6/pxzRyoOaPFXV/L7qXlSoOaCsjT
         W0NQ==
X-Forwarded-Encrypted: i=1; AHgh+RoUdmLIrsMUMfKXfVPf81yg/cKjKGBZmin8/DogYyBXkp4wj4Lgb7RWjQKydkmFoyUwnmEXsa2CpUZUUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzhZG8A3I9PLZeB6+xhM5mxA+4OJrF5pymWuXa/utY20Pj95Xm
	tsgZ3XHyzoxjg82l2CsDNNfwKorgZBDn1ARzqsyCmgNT+D2HE+3tkBJ7
X-Gm-Gg: AfdE7cloosHSWzixQU3Jo/y7aCa7NXiX8qF8RB5EKWdLWl+5xZhBQzOpLYSG7J3WkYX
	V7Svq8Y1x5a8VPhSNJrOfUMJs0YA5QJVykFQpyUJE8Gq6VS5x8Tx2WLR7IKeUDqWHolOPOIR4cw
	MSwM5iXLBOxXuCdJCdrWeZnLDFC4GzQVmneRc9EXqacDe1SOdVM7edMKUTDHmiloTKpWDKPRe6h
	gIf/aL7aNED2+dhsoF+3zXPpJZFSe95R6xKr9omsMPGWwLEoI2daTMn7bAZ9+ZsDJurQDtaB0pi
	ijWEexxSgRnXRwFL0tBUen/Iac/SFFTTY07ys4A71cvkO6ebPS3lijzCYEthelR4jvQpozrSVJD
	bFHyifEHJ4nv5+vB6+4GogEvzawafpKpPsDH0qBLb7w++6oP4qzZmJotG9e2nLXcdEvuXvO0XjZ
	tOt5gBJ95CN44vwmy4FGfV0ljvaCGqLXBLs7gSNqowrbjlJO0S0LBJ/I8=
X-Received: by 2002:a05:6000:4381:b0:473:1e79:87e6 with SMTP id ffacd0b85a97d-47f623ae0demr1833373f8f.3.1784275250197;
        Fri, 17 Jul 2026 01:00:50 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edda29sm1769819f8f.32.2026.07.17.01.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:00:49 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (lm90) Switch channel parsing to fwnode APIs
Date: Fri, 17 Jul 2026 11:00:27 +0300
Message-ID: <20260717080027.8370-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717070614.6492-1-flaviu.nistor@gmail.com>
References: <20260717070614.6492-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 17 Jul 2026 10:06, Flaviu Nistor wrote
>On Fri, 17 Jul 2026 09:49, sashiko-bot wrote:
>>Thank you for your contribution! Sashiko AI review found 2 potential issue(=
>>s) to consider:
>>
>>New issues:
>>- [Low] Incompatible pointer type causing build failure
>>
>>Pre-existing issues:
>>- [Critical] Sysfs read triggers NULL pointer dereference via uninitialized=
>> hwmon_dev
>>--
>>
>>--- Patch [1]: [PATCH v2] hwmon: (lm90) Switch channel parsing to fwnode AP=
>>Is ---
>>commit 3d5d792e5529b3545ccefc21f7dfd9c2acecc999
>>Author: Flaviu Nistor <flaviu.nistor@gmail.com>
>>
>>hwmon: (lm90) Switch channel parsing to fwnode APIs
>>   =20
>>This commit replaces OF property handling with fwnode APIs in the probe
>>function to read channel properties. This improves compatibility by no long=
>>er
>>limiting it to Device Tree.
>>
>>Link: https://lore.kernel.org/all/20260713190659.4511-1-flaviu.nistor@gmail=
>>.com/
>>
>>> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
>>> index 4b9c0ccdf2609..7d4b8e61bec51 100644
>>> --- a/drivers/hwmon/lm90.c
>>> +++ b/drivers/hwmon/lm90.c
>>[ ... ]
>>> @@ -2701,27 +2701,27 @@ static int lm90_probe_channel_from_dt(struct i2c_=
>>client *client,
>>[ ... ]
>>> -=09err =3D of_property_read_s32(child, "temperature-offset-millicelsius"=
>>>, &val);
>>> +=09err =3D fwnode_property_read_u32(child, "temperature-offset-millicels=
>>ius", &val);
>>
>>[Severity: Low]
>>Will this cause a build failure or compiler warning?
>>
>>In lm90_probe_channel(), val is declared as an s32, but it is being passed
>>to fwnode_property_read_u32() which expects a u32 pointer. This pointer typ=
>>e
>>mismatch can trigger a -Wincompatible-pointer-types error in modern builds.
>
>This is absolutely true and I can't understand how this got into the patch since
>I have test is. I will send a v3 correcting s32 to u32.
>Sorry for this!
>
>Best regards,
>Flaviu
>

I have double checked and there is no warning or error when building the driver.
Please ignore my previews reply as v2 can be used. I had in mind something different
and it looks like not a great morning start. I am sorry for the noise on the mailing list.

Best regards,
Flaviu
