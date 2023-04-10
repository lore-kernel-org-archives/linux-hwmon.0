Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17BDC77B61
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 Apr 2023 19:17:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjDJTRK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 Apr 2023 15:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbjDJTRJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Apr 2023 15:17:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 795B11981
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Apr 2023 12:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681154179;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sPFo235kyBYgg2fLMT3ZW1ogJR9rn6lHcH28gnhO+so=;
        b=Fjx+k0zZyTuweNwOhYhWBF1i2wMFANfadytAtjC1ha6phZFIgh//lfK4bxX9b9cGBMfy6V
        nba8FkQCee1/+/Fff0fWWFQJeAmxh8PoTX1Rs0EuypMTlPh+VN+Cm3FkAiDQw4JYdl4qTx
        qsURO/5cRch4vdCtMy/yifFZrFDRKco=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-OcERvOmEPNSZ2TbNSkVMVQ-1; Mon, 10 Apr 2023 15:16:18 -0400
X-MC-Unique: OcERvOmEPNSZ2TbNSkVMVQ-1
Received: by mail-wm1-f70.google.com with SMTP id bh18-20020a05600c3d1200b003f05a99b571so6651988wmb.8
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Apr 2023 12:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681154176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPFo235kyBYgg2fLMT3ZW1ogJR9rn6lHcH28gnhO+so=;
        b=n9mQBgsGgsaqoRcFiBbEXrkrkvIj5AzU8ldD1kKyQSEDuAhzwWUSbzrJeRk/MfHVYY
         mcCAAN8TR3xIHyP4rhb9SXt8uUVNVqfo0bZinnooFZCvHaJv4esPlQohTIV+D7bYVcGF
         3QpfTGRGnMgXcL4COFV7Q9w4yrx69lauJsMyvNG6diDEvXEPNeq66+F4VrT/Kiu2a2TZ
         23z+WPvHfZTt7ddfaDKwRaZRGegF2Tkf2CJSvwjsgB8Sb75S2A051/WjMzwQajAf2nJm
         lYUehZdqIsPl0HJHVk+nJI0PXfGDHLt/IyCmERLt7giyLm/xIyw5iBIta47+Yuz93JdM
         hKPA==
X-Gm-Message-State: AAQBX9feJ4rggEvaj33fw5ivC0N7LRyQEY3i3h8e9V70n6wJ4aK4iaEO
        Di5eno8G5wXIvUgCKb49XXOZBBe4Yl6ZDAggED9xbXwnjlT+XkcXXAK4jaN5J/fWg72zvCaKWmO
        L2r/8qwyzKSg5ZXZaoroW0Ew=
X-Received: by 2002:a7b:cd10:0:b0:3e2:19b0:887d with SMTP id f16-20020a7bcd10000000b003e219b0887dmr7974056wmj.25.1681154176078;
        Mon, 10 Apr 2023 12:16:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yj4C6u1lvqj5x8nYc4rUtnI/cLoYn4IqOCfzJdLFCUYWU4OgKl1a1UOtM9Oz4tcJga59u2Qw==
X-Received: by 2002:a7b:cd10:0:b0:3e2:19b0:887d with SMTP id f16-20020a7bcd10000000b003e219b0887dmr7974048wmj.25.1681154175783;
        Mon, 10 Apr 2023 12:16:15 -0700 (PDT)
Received: from redhat.com ([2.52.10.80])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c358500b003ede04deb14sm18677422wmq.48.2023.04.10.12.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 12:16:15 -0700 (PDT)
Date:   Mon, 10 Apr 2023 15:16:11 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alvaro Karsz <alvaro.karsz@solid-run.com>,
        Jason Wang <jasowang@redhat.com>,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] vdpa: solidrun: constify pointers to hwmon_channel_info
Message-ID: <20230410151532-mutt-send-email-mst@kernel.org>
References: <20230407150130.79917-1-krzysztof.kozlowski@linaro.org>
 <0395eff6-694e-1a2f-de78-8cb9d7b129a7@roeck-us.net>
 <20230410055634-mutt-send-email-mst@kernel.org>
 <2facc7cd-81fa-b8b7-6974-217392906578@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2facc7cd-81fa-b8b7-6974-217392906578@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Apr 10, 2023 at 07:03:01AM -0700, Guenter Roeck wrote:
> On 4/10/23 02:56, Michael S. Tsirkin wrote:
> > On Fri, Apr 07, 2023 at 04:08:30PM -0700, Guenter Roeck wrote:
> > > On 4/7/23 08:01, Krzysztof Kozlowski wrote:
> > > > Statically allocated array of pointed to hwmon_channel_info can be made
> > > > const for safety.
> > > > 
> > > > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > 
> > > > ---
> > > > 
> > > > This depends on hwmon core patch:
> > > > https://lore.kernel.org/all/20230406203103.3011503-2-krzysztof.kozlowski@linaro.org/
> > > > 
> > > > Therefore I propose this should also go via hwmon tree.
> > > 
> > > I am not going to apply patches for 10+ subsystems through the hwmon tree.
> > > This can only result in chaos. The dependent patch is available at
> > > 
> > > git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-const
> > 
> > Doesn't it cause build errors or warnings there?
> > 
> 
> Are you saying that "hwmon: constify pointers to hwmon_channel_info" applied on its own
> on top of v6.3-rc5 (as done in above branch) causes build errors or warnings ?
> I have not seen any such reports, and I don't immediately see why that would be
> the case. Please elaborate.
> 
> Guenter


I'm not saying that, I just assumed the vdpa patch fixes build.
If build is ok we can just wait for hwmon patch to get upstream. No
rush.

> > > or wait until after the next commit window to apply this patch.
> > > 
> > > Thanks,
> > > Guenter
> > > 
> > > > 
> > > > Cc: Jean Delvare <jdelvare@suse.com>
> > > > Cc: Guenter Roeck <linux@roeck-us.net>
> > > > Cc: linux-hwmon@vger.kernel.org
> > > > ---
> > > >    drivers/vdpa/solidrun/snet_hwmon.c | 2 +-
> > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/vdpa/solidrun/snet_hwmon.c b/drivers/vdpa/solidrun/snet_hwmon.c
> > > > index e695e36ff753..65304354b34a 100644
> > > > --- a/drivers/vdpa/solidrun/snet_hwmon.c
> > > > +++ b/drivers/vdpa/solidrun/snet_hwmon.c
> > > > @@ -159,7 +159,7 @@ static const struct hwmon_ops snet_hwmon_ops = {
> > > >    	.read_string = snet_hwmon_read_string
> > > >    };
> > > > -static const struct hwmon_channel_info *snet_hwmon_info[] = {
> > > > +static const struct hwmon_channel_info * const snet_hwmon_info[] = {
> > > >    	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_LABEL,
> > > >    			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_LABEL),
> > > >    	HWMON_CHANNEL_INFO(power, HWMON_P_INPUT | HWMON_P_LABEL),
> > 

