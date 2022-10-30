Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EECC38A02
	for <linux-hwmon@archiver.kernel.org>; Sun, 30 Oct 2022 01:39:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbiJ3BjP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Oct 2022 21:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiJ3BjM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Oct 2022 21:39:12 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E872B184
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Oct 2022 18:39:12 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id p127so9850375oih.9
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Oct 2022 18:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mSCm4l8onXxthA3EcbTiCQGcs1wmQ0X7aKiq2L4kfIQ=;
        b=p6ZPBOjLEO3DxAcKXfXWvDdsvmBfWDQJP6Rp6jSAKfAll9p1HJtYbFgF9dC1KqG4W2
         To80b4ccghg1A07LfNmB3y+rD5phQ2uF1F0wS1roKFjsmobg2G/W3UmjdpWokPpUF7xb
         2s08Fa+fTfNJAL2hidvhYkW4LlpZfIK3SdapR9Ence6GdBw7cEDti85TAVg/HeOlXzLr
         sDtQEykLA3q34TueLqyECSGyC3lRNIng9I9YeKj1/vVSE1890A364t8YgGbNpSeSVdTQ
         1pvc8AJIhRkpldK90H2oYUoxOMHwdJsTOync6wdoB/DRufTfWJQsUuIrEJ5+V8j/4GjW
         7/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mSCm4l8onXxthA3EcbTiCQGcs1wmQ0X7aKiq2L4kfIQ=;
        b=CMojFg/CegV0rCubt2qSYbo6KdCUxc2Qer0JTkZ1FSf46kEdJCYhsSQGqd/rBTCLcR
         lCaWLCOrtNiivhZq0Ge5DQgFQ9giwkYRe/n7GINlk/8Fj5yp0IRTwNFKkKMknmfwsM/j
         Ve7gFUZNya8iRmxLS9SImKnEiPzO3w+wQHAp/cwBhukt4uCwasRwSnsC/8KIPEYsfq5q
         kyM6x+plMghXQnlsedWBEO9A2tHkdIQtKdWjCHmgAaA3QfIzW0YCp8w3MO4S4iRx4c3+
         bIUd/2E7h+ESnyn70B95EW/Iutu342F2FW1iu1TM3kdjoqR9VoOxkB2n31G+DnzT0YxU
         yU/A==
X-Gm-Message-State: ACrzQf3x/5DkNG0NMct3n+uhyj0ibUgchRQhENh8oTKT9zYO4hrAFf8j
        mV4B2RHAhNQ5fN1DYfMoBxV93SaFkK0=
X-Google-Smtp-Source: AMsMyM5juz7ntoqycBVf8E57HM2OAMdfOASL230tSlH3Rp9vbUhhDwdc5NVUX9tqMiFEv3CDJQ9wZg==
X-Received: by 2002:a05:6808:1706:b0:351:8703:2271 with SMTP id bc6-20020a056808170600b0035187032271mr11969796oib.76.1667093951527;
        Sat, 29 Oct 2022 18:39:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e95-20020a9d2ae8000000b006690f65a830sm1214615otb.14.2022.10.29.18.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 18:39:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 29 Oct 2022 18:39:09 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/1] hwmon: (it87) Create DMI matching table for
 various board settings
Message-ID: <20221030013909.GA1264837@roeck-us.net>
References: <20221029103057.3234561-1-frank@crawford.emu.id.au>
 <4a4dd112-2c71-9b8e-8e33-95dac9a8d32f@roeck-us.net>
 <f802b322431a182c4bdf0f91cd4114fe381ebfe7.camel@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f802b322431a182c4bdf0f91cd4114fe381ebfe7.camel@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Oct 30, 2022 at 10:43:59AM +1100, Frank Crawford wrote:
> On Sat, 2022-10-29 at 07:04 -0700, Guenter Roeck wrote:
> > On 10/29/22 03:30, Frank Crawford wrote:
> > > Changes in this patch set:
> > > 
> > > * Define the DMI matching table for board specific settings during
> > > the
> > >    chip initialisation and move the only current board specific
> > > setting
> > >    to this new table.
> > > 
> > > * Export the table for use by udev.
> > > 
> > > v2: updates following comments:
> > > 
> > > * Converted to use callback function.
> > > 
> > > * Moved call to callback funtion to sio_data into it87_find in line
> > >    with other settings for sio_data.  This requires dmi_data also
> > > passed
> > >    to access additional data.
> > > 
> > 
> > That is really not what I meant when I asked to use a callback
> > function.
> > As written, the code might as well call that function directly from
> > the
> > init code, and there would be no reason to have a callback function
> > pointer.
> > 
> > A callback function would only make sense to me if it is added
> > to struct dmi_system_id, and called via dmi_check_system().
> > See other callers of dmi_check_system() for examples.
> 
> Oh, investigating other kernel code I see what you mean, and it does
> simplify one possible future update, but looking through the other
> modules in hwmon, I can't see any using a DMI callback.  The primary
> use of dmi_check_system() is just as a count of successful matches.
> 
> Also, just going back to a previous comment about creating a static
> version of sio_data and updating this in the callback, this does worry
> me going forward as in future I hope to add code to handle the case of
> multiple chips.  Updating the static version for one chip may cause
> issues with the other chips.
> 
The value is set based on DMI data. I don't see how that would make
a difference even if there are multiple chips. The DMI data would
still be the same and is board specific, not chip specific.

Guenter
