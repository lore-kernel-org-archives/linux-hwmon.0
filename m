Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D26BC4338F
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 17:49:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C961460F11
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 17:49:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238803AbhHNRuB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 14 Aug 2021 13:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238690AbhHNRuB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 14 Aug 2021 13:50:01 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCEC3C061764
        for <linux-hwmon@vger.kernel.org>; Sat, 14 Aug 2021 10:49:32 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id r19-20020a0568301353b029050aa53c3801so15989717otq.2
        for <linux-hwmon@vger.kernel.org>; Sat, 14 Aug 2021 10:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=JqtyRxmDHUdVNwpJwp4yp6qvZzlAUcYMVJ9thBQJG+4=;
        b=fVSZKilBzSkv1ZQgk402wubfdgLqhtdWr9Fa872wjF1KaCNzND7uOWaMCIcSoNBXvr
         lhtmuz0LuQZO6FybGKaCoQyoLzE2XCu3U9hCog/agvM/1VyIIolXifMbimjHbtD/484B
         ghOBs6qCIzsj+nmEDjbBdRoLwaiIL9q6LA199W1YrWhLSJTM4VYG8324g/XH0GufUr8A
         3TrUIcV8ids5H0Y//1FDEDLyLMP96+XUOoVAS0HkQTr1BQeAUwVS88zFxEnS4OBJrl3c
         HNT4zkIdZsi2oopM6D3ZWyk5ugjwoqa9IUx/C43yROaGMIEZcGc14DEUjj5/1JaSq1CC
         SQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=JqtyRxmDHUdVNwpJwp4yp6qvZzlAUcYMVJ9thBQJG+4=;
        b=mLYl077N10JMWEidanTk/79MfSXIAfqXFxIH6gdAOj9hgrBX1qZVkrDVMeUX3awtRu
         qozWyK7ZQGB7uIz50Awcqx5JCNnSb8Bg2oAZ+Dl1zvxybcyKouLtW7SYRHujEDisLXFT
         FtnV62YDXX+ikMJCOogk5bQLK5wf7F3XA3hnnV5tVoEyIH4ZgPB04BspboglNSMOolCq
         hOS3Kidn3QedSPtrTMDpVG7kyn5IPQGto2xSX1Z2Yyt9gyK/u2hiNhBbdBxOnGugh2Jd
         xLCYXOdikycfUDUpo9M9yD4g7k5JzdxcwOivX8ngF/JuVpimb9jNoV0dSdrh64MG39SI
         rUFQ==
X-Gm-Message-State: AOAM531bJk4FIb2D8dCrxfnWwnnhheFxgvn4RAdKUcqXIV0CrKvgsES/
        0f6qg2iyIEMPXGclOFNbcYU=
X-Google-Smtp-Source: ABdhPJzU89Xc2x4kUzSpcAMNKaxO7zjr+Wgrp4s+iDmJW7xRpe36B4LnJWihEaZg+aYwp2ojH/tm/g==
X-Received: by 2002:a05:6830:43a8:: with SMTP id s40mr2466387otv.209.1628963371167;
        Sat, 14 Aug 2021 10:49:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 65sm1019138ooc.2.2021.08.14.10.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Aug 2021 10:49:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 14 Aug 2021 10:49:29 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     W_Armin@gmx.de
Cc:     pali@kernel.org, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/4] hwmon: (dell-smm) Mark tables as __initconst
Message-ID: <20210814174929.GA2769052@roeck-us.net>
References: <20210814143637.11922-1-W_Armin@gmx.de>
 <20210814143637.11922-2-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210814143637.11922-2-W_Armin@gmx.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Aug 14, 2021 at 04:36:34PM +0200, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Both the config and the DMI tables never change and
> are only used during module init for setting up
> the device data struct.
> Mark all of them as const and __initconst for a
> smaller runtime memory footprint.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Reviewed-by: Pali Rohár <pali@kernel.org>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> --
> 2.20.1
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 43da32ad2dce..68af95c1d90c 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -957,7 +957,7 @@ enum i8k_configs {
>  	DELL_XPS,
>  };
> 
> -static const struct i8k_config_data i8k_config_data[] = {
> +static const struct i8k_config_data i8k_config_data[] __initconst = {
>  	[DELL_LATITUDE_D520] = {
>  		.fan_mult = 1,
>  		.fan_max = I8K_FAN_TURBO,
> @@ -1115,7 +1115,7 @@ static const struct dmi_system_id i8k_blacklist_fan_type_dmi_table[] __initconst
>   * support for affected blacklisted Dell machines stay disabled.
>   * See bug: https://bugzilla.kernel.org/show_bug.cgi?id=195751
>   */
> -static struct dmi_system_id i8k_blacklist_fan_support_dmi_table[] __initdata = {
> +static const struct dmi_system_id i8k_blacklist_fan_support_dmi_table[] __initconst = {
>  	{
>  		.ident = "Dell Inspiron 7720",
>  		.matches = {
> @@ -1156,14 +1156,14 @@ enum i8k_fan_controls {
>  	I8K_FAN_34A3_35A3,
>  };
> 
> -static const struct i8k_fan_control_data i8k_fan_control_data[] = {
> +static const struct i8k_fan_control_data i8k_fan_control_data[] __initconst = {
>  	[I8K_FAN_34A3_35A3] = {
>  		.manual_fan = 0x34a3,
>  		.auto_fan = 0x35a3,
>  	},
>  };
> 
> -static struct dmi_system_id i8k_whitelist_fan_control[] __initdata = {
> +static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
>  	{
>  		.ident = "Dell Latitude 5480",
>  		.matches = {
