Return-Path: <SRS0=n6ZT=SY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DF7C10F11
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Apr 2019 19:29:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D37C820896
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Apr 2019 19:29:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tjvV+PJG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbfDVT3b (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Apr 2019 15:29:31 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38810 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbfDVT3b (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Apr 2019 15:29:31 -0400
Received: by mail-pg1-f194.google.com with SMTP id j26so6293742pgl.5
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Apr 2019 12:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=D3bDpw4fEtqb/bI7gw+bwBjymONUMY4BKq8vzaYg6Wk=;
        b=tjvV+PJGM0Axas0R+AoG7OC7MrKsgJwX75xfhVmAhztyAEZdz4zGIVUpCmTkweFePq
         UC6igVLsnBH65uK1VzsgpTav+hB2udFVpauGy+w9wNi98OxCgW4F8/fZt7Ng9MCaqreP
         1aPuzgpGaJ7ta/gAunJvXQdqpfpOrkKnsIHPIL7n2SCmSdSU4ctvh+nJAUw9eUAChfdB
         hWbfc4turEHlOrjEq4SJRNBI2lxa4my3jPnJfJhwrHtlPeR6G7jffVv+OondioTT2NOd
         3Jae4fD6sGuAFAAfRRm7Eno/bcdecSz2y4R7m97sRirl4U1zhamrVQ8eQcKXrlyNiSfF
         G8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=D3bDpw4fEtqb/bI7gw+bwBjymONUMY4BKq8vzaYg6Wk=;
        b=mtKgmDxzFBY5xh7ghhhjw0k8Xs2C4MNj0N+aeEOQSUsDFBjUDy5rkLHfaxofYKtqjs
         8O6oFbYVvKgTuYlpTJmYOsmat5EFRlJxqhKEUxW0ZsjjYzX0i7i0eR1xiK6RtVcrbWfx
         PrkIfDzMeZTyzXWsDZRBQ2LdBQ+RLfAZIeJE2EnTYmdIIWWs3BQSo19pAzESwO/Cw930
         2qQ/jS/UOy1CwvHr0kSeWHPqyY3dYz07q5apNBn4e2PuuHPYWERLkmkkQZthuYQB1/WD
         MphBVsA0U89swx2oSJWnx8+q1f4cX4/BcKBrYrLa8LjXr0pw+6IF7pF/7Vjw26vfef26
         w8Fw==
X-Gm-Message-State: APjAAAUi2vhU1OdrJTYa0ir/s3MPStttsee9uQiJCNP9EK68Y7xm87Fc
        PAIBoyViGMdqw9v42unZOyg=
X-Google-Smtp-Source: APXvYqxO7f09O9zsUoDZ5m13qc/wBfEHebvExUWaNQ1PziXdlKQgC2pPB9emPG52bZCOn9ZGoDFgDg==
X-Received: by 2002:a63:c605:: with SMTP id w5mr20078652pgg.355.1555961370610;
        Mon, 22 Apr 2019 12:29:30 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v9sm17538016pgf.73.2019.04.22.12.29.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Apr 2019 12:29:29 -0700 (PDT)
Date:   Mon, 22 Apr 2019 12:29:27 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Sudeep Holla <sudeep.holla@arm.com>, linux-hwmon@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: SCMI sensor reads unit scaling
Message-ID: <20190422192927.GA5493@roeck-us.net>
References: <9207bc01-e0c6-ef73-6a24-6deda7b789c5@gmail.com>
 <7d23066b-fd45-1784-3c2a-7e44eeae63bf@roeck-us.net>
 <2e6a6141-762f-7618-60b9-84fa1190813d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e6a6141-762f-7618-60b9-84fa1190813d@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Apr 22, 2019 at 11:31:18AM -0700, Florian Fainelli wrote:
> On 4/20/19 10:31 AM, Guenter Roeck wrote:
> > On 4/20/19 9:43 AM, Florian Fainelli wrote:
> >> Hi Sudeep, Guenter,
> >>
> >> The current SCMI hwmon support does not seem to make use of the sensor
> >> scale/unit as defined in the sensor replies (or the update scale for
> >> that matter).
> >>
> >> I came up with the patch below which gets the job done, but I am worried
> >> about possibly breaking people's SCMI deployments and sensors reading
> >> because they may have intentionally or not already decided to return a
> >> value which is scaled the way Linux's hwmon expect it, and may, or may
> >> not have populated a valid unit number in the sensor reply.
> >>
> >> Ideally we should probably do two conversions:
> >>
> >> - from within scmi_sensor_reading_get(), scale the value as indicated by
> >> the reply
> >> - from within scmi_hwmon_read(), take that scaled value and apply the
> >> necessary conversion expected by Linux's HWMON conventions (e.g.:
> >> reporting voltage as mV values)
> >>
> >> What do you think?
> >>
> > 
> > Reported values have to follow HWMON conventions. If not, this is a bug
> > and needs to get fixed. The argument about not changing the userspace ABI
> > does not apply to bugs.
> 
> Upon re-reading the SCMI specification, what is not clear to me is
> whether you have the liberty to:
> 
> - target the Linux HWMON sensor units as specified by
> Documentation/hwmon/sysfs-interface by e.g.: putting a millidegree
> Celsius value in the SCMI reply and an power of 10 multiplier value of 0
> (which would be treated as not doing any scaling)
> 
> - must provide the raw value as provided by the sensor as well as
> indicate the scale, e.g.: millidegree celsius and specifying a scale of -3
> 
> Sudeep can you clarify how you would approach making use (or not) of the
> power of 10 multiplier as defined by the SCMI specification?
> 

Not sure I understand. SCMI and hwmon sysfs ABI requirements are orthogonal.
hwmon expects certain units (mostly milli, but micro for power). What the
hardware reports is irrelevant. The SCMI driver needs to convert values
reported by SCMI into values expected by the hwmon ABI. If it does not do
that today, that is a bug which needs to be fixed.

Thanks,
Guenter
