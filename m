Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA4421C9F1
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Mar 2025 12:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213862; cv=none; b=UBsphuU33q+4LopKzM8K1sMS1DM3F6cv3yc3YgwUfMVAtUg/zKQo4qtnfcc9fqN5jDwkffoimr+JvbW5AtfoliBMxywfdD8HoOwlkzMj72TvBEfpZPzpRNQ0PdDVEmmVDEmXVDUDKG/EYOYtpTkhblZH5IOeK3Ii+jLawjtALQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213862; c=relaxed/simple;
	bh=3Ae0R2whHgk5YCE3sDscO9JGMTxEcvaeefpUXn112CE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oPOjG3U14njJazkvrUxdoDp16rCrw6AtDSO+3L0IS9nAQ7jbOoOZzURnl0AeTOCAloiIef9kKt34g8S427pKM0R+x/zMWVmdzBuAYiCCugeDmdYaoBpH6RPFhW77F5Q6e2/28CRjDdH2z6iptRZPYKlRNY/z8xfa6Lt6qujxEPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iakimvOw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iakimvOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742213859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B8OHh+hlUOhWWOuLdymqvwjTRJjGBPoWrkx5o9GuUXg=;
	b=iakimvOwtETVa9hPFg5dk1AFEOjZ9YO2ADvNuPO+uDt5bHgGogBjOMwBclAq2ALfiyU5sd
	7TyuFdw0dJrYf2Du8Pyj9gVsKkcmvDscvHym3D/pF6Pm2a9mhTkS+Et8c4Oolknh6GHdcs
	yZxGeHbwoYymaolp5mawjppARbMBcm8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-FDWpx9_5OMOSsYnFUHZnJA-1; Mon, 17 Mar 2025 08:17:38 -0400
X-MC-Unique: FDWpx9_5OMOSsYnFUHZnJA-1
X-Mimecast-MFC-AGG-ID: FDWpx9_5OMOSsYnFUHZnJA_1742213857
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5e72cc36fdfso4248286a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Mar 2025 05:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213856; x=1742818656;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B8OHh+hlUOhWWOuLdymqvwjTRJjGBPoWrkx5o9GuUXg=;
        b=p4YJ9whv6vUsBmJOZaL+/C4HMLoX+SExcoKpso5FywJ42X/repvhovDoGqcb8wQhyy
         4rLz8EwaTf0Twi7OFfWaepnGyOSc1DmPWM6w0yIffgH421jp/GCA6Ixm3v9dk89apnwh
         z97TP5qc0y10wp4KODdks5j69VZ/SLywlKdwy1a7Uji/tsh71/34FX04XPjOSkOK81ke
         tYNCgSKI6jQItWjX+cAMuiq8yntMZKt/+6GY+4rpYOIKvQub0iW+nV1T07tRYvc0PwCE
         C9fv5PZsCDeLMw8HRL10MtErKicuF3YumGNqPxPE8Yo4X41xW8MHotjSd97yRvaXbSo5
         +qRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3BO6f4OOgiCwnbGmmXyhV+bUTkcGdiSqXGMUj/36dtLq/ftCuMJaEYlmd2QPVeg0ypPk+YNqzam/U6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc9fqMpDuUNvaM4z92oNW+yeMMFiD3BtOY6uviB/fvKfNuNoHv
	oORgz+TIL/1rerLCVj7gXXJpnnvb/otiZ6DeXIWUjai0sZl05hq9tEX1VQ09ooJm5k+82yEFco5
	168gNA094rSnuufhm2LpufGN/Xnr8OqsyGiMvSmWhLLoxxrDRPmgisa4mBFU0AxpQuQZoGqw=
X-Gm-Gg: ASbGncsqe96QCfrqAwCf9Ge0Km19jAAXOSR22Hp9sY/egSuG3/N12yd/w3tjCothP+C
	2GNqPOS4yGn6O5O7dttO6bPsDQCkbzrw9WSW2yb+YwjHUu80gGe6OhnGbEa/5Kwd6Mnt7xanunS
	auQx+G+vZglT4cZTyi6tGqB5OLNwDXtw6cZoXHiKDLdKAo98TQR1YuUJE4/swEGpl6K9ZUk+PJO
	aQx3x3KNB8vezGfthXPpAea0ak3xqIUfTU3v9MCvGDuw7uWddqcirVwY92HLHmQG3UAboZFs32X
	xvc6ZsRtwJ96an/L/r8=
X-Received: by 2002:a05:6402:5253:b0:5db:f5e9:6745 with SMTP id 4fb4d7f45d1cf-5e89c05c6e3mr13125327a12.0.1742213855825;
        Mon, 17 Mar 2025 05:17:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGedLlclkbwF6k+l5x0k8ZtpO4H3s8DmKtMvBvtWUpIlRsQmOTHZSk8li8Z31c6QTvvC/fj5g==
X-Received: by 2002:a05:6402:5253:b0:5db:f5e9:6745 with SMTP id 4fb4d7f45d1cf-5e89c05c6e3mr13125302a12.0.1742213855427;
        Mon, 17 Mar 2025 05:17:35 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e81692e5cbsm5798935a12.6.2025.03.17.05.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 05:17:34 -0700 (PDT)
Message-ID: <dd2eb968-91a3-46f1-bf43-edcf4ca8a9d0@redhat.com>
Date: Mon, 17 Mar 2025 13:17:33 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/13] power: supply: add inhibit-charge-s0 to
 charge_behaviour
To: Antheas Kapenekakis <lkml@antheas.dev>, Guenter Roeck <linux@roeck-us.net>
Cc: platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Joaquin Ignacio Aramendia <samsagax@gmail.com>,
 Derek J Clark <derekjohn.clark@gmail.com>,
 Kevin Greenberg <kdgreenberg234@protonmail.com>,
 Joshua Tam <csinaction@pm.me>, Parth Menon <parthasarathymenon@gmail.com>,
 Eileen <eileen@one-netbook.com>
References: <20250311165406.331046-1-lkml@antheas.dev>
 <20250311165406.331046-6-lkml@antheas.dev>
 <CAGwozwELmp7v_46wmo_bbORWMEeA-NWRjXeRML4Jd=p=huLNaw@mail.gmail.com>
 <0aec1406-00cd-44ee-959f-48b646d3dad3@roeck-us.net>
 <CAGwozwHEoTb4uC=aoSXV2AMFjpZ_7+pDbMS1c_zs_QGAzC_qdA@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAGwozwHEoTb4uC=aoSXV2AMFjpZ_7+pDbMS1c_zs_QGAzC_qdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Antheas,

Thanks you for your work on this.

On 16-Mar-25 17:46, Antheas Kapenekakis wrote:
> On Sun, 16 Mar 2025 at 14:56, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 3/16/25 04:40, Antheas Kapenekakis wrote:
>>> On Tue, 11 Mar 2025 at 17:54, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>>>>
>>>> OneXPlayer devices have a charge bypass feature
>>>> that allows the user to select between it being
>>>> active always or only when the device is on.
>>>>
>>>> Therefore, add attribute inhibit-charge-s0 to
>>>> charge_behaviour to allow the user to select
>>>> that bypass should only be on when the device is
>>>> in the s0 state.
>>>>
>>>> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>> ---
>>>>   Documentation/ABI/testing/sysfs-class-power | 11 ++++++-----
>>>>   drivers/power/supply/power_supply_sysfs.c   |  1 +
>>>>   drivers/power/supply/test_power.c           |  1 +
>>>>   include/linux/power_supply.h                |  1 +
>>>>   4 files changed, 9 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-class-power b/Documentation/ABI/testing/sysfs-class-power
>>>> index 2a5c1a09a28f..4a187ca11f92 100644
>>>> --- a/Documentation/ABI/testing/sysfs-class-power
>>>> +++ b/Documentation/ABI/testing/sysfs-class-power
>>>> @@ -508,11 +508,12 @@ Description:
>>>>                  Access: Read, Write
>>>>
>>>>                  Valid values:
>>>> -                       ================ ====================================
>>>> -                       auto:            Charge normally, respect thresholds
>>>> -                       inhibit-charge:  Do not charge while AC is attached
>>>> -                       force-discharge: Force discharge while AC is attached
>>>> -                       ================ ====================================
>>>> +                       ================== =====================================
>>>> +                       auto:              Charge normally, respect thresholds
>>>> +                       inhibit-charge:    Do not charge while AC is attached
>>>> +                       inhibit-charge-s0: same as inhibit-charge but only in S0
>>>> +                       force-discharge:   Force discharge while AC is attached
>>>> +                       ================== =====================================
>>>>
>>>>   What:          /sys/class/power_supply/<supply_name>/technology
>>>>   Date:          May 2007
>>>> diff --git a/drivers/power/supply/power_supply_sysfs.c b/drivers/power/supply/power_supply_sysfs.c
>>>> index edb058c19c9c..1a98fc26ce96 100644
>>>> --- a/drivers/power/supply/power_supply_sysfs.c
>>>> +++ b/drivers/power/supply/power_supply_sysfs.c
>>>> @@ -140,6 +140,7 @@ static const char * const POWER_SUPPLY_SCOPE_TEXT[] = {
>>>>   static const char * const POWER_SUPPLY_CHARGE_BEHAVIOUR_TEXT[] = {
>>>>          [POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO]            = "auto",
>>>>          [POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE]  = "inhibit-charge",
>>>> +       [POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_S0]       = "inhibit-charge-s0",
>>>>          [POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE] = "force-discharge",
>>>>   };
>>>>
>>>> diff --git a/drivers/power/supply/test_power.c b/drivers/power/supply/test_power.c
>>>> index 2a975a110f48..4bc5ab84a9d6 100644
>>>> --- a/drivers/power/supply/test_power.c
>>>> +++ b/drivers/power/supply/test_power.c
>>>> @@ -214,6 +214,7 @@ static const struct power_supply_desc test_power_desc[] = {
>>>>                  .property_is_writeable = test_power_battery_property_is_writeable,
>>>>                  .charge_behaviours = BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO)
>>>>                                     | BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE)
>>>> +                                  | BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_S0)
>>>>                                     | BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE),
>>>>          },
>>>>          [TEST_USB] = {
>>>> diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
>>>> index 6ed53b292162..b1ca5e148759 100644
>>>> --- a/include/linux/power_supply.h
>>>> +++ b/include/linux/power_supply.h
>>>> @@ -212,6 +212,7 @@ enum power_supply_usb_type {
>>>>   enum power_supply_charge_behaviour {
>>>>          POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO = 0,
>>>>          POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE,
>>>> +       POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_S0,
>>>>          POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE,
>>>>   };
>>>>
>>>> --
>>>> 2.48.1
>>>>
>>>
>>> Hi Guenter,
>>> I think I need an ack here, and then someone from platform-x86 to
>>> triage the series.
>>>
>>> Do I need to cc anyone extra?
>>>
>>
>> You need to cc the maintainers of affected subsystems. Copying the mailing
>> list is insufficient.
>>
>> Guenter
>>
> 
> Can you tell me who to cc from platform-x86 and linux-pm?

Sebastian Reichel <sre@kernel.org> (maintainer:POWER SUPPLY CLASS/SUBSYSTEM and DRIVERS)
linux-pm@vger.kernel.org (open list:POWER SUPPLY CLASS/SUBSYSTEM and DRIVERS)
linux-kernel@vger.kernel.org (open list)

And something which the tools will not tell you, since charge_behaviour support
was added by Thomas Thomas should be added to the Cc too:

Thomas Weißschuh <linux@weissschuh.net>

Note I also have some generic remarks about this patch, I'll do a top-level
reply to the patch for those.

Regards,

Hans


