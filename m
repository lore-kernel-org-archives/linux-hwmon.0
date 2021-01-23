Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E235C433DB
	for <linux-hwmon@archiver.kernel.org>; Sat, 23 Jan 2021 16:09:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F292D22A84
	for <linux-hwmon@archiver.kernel.org>; Sat, 23 Jan 2021 16:09:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725798AbhAWQJk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 23 Jan 2021 11:09:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbhAWQJj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 23 Jan 2021 11:09:39 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF557C06174A
        for <linux-hwmon@vger.kernel.org>; Sat, 23 Jan 2021 08:08:58 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id k8so8295026otr.8
        for <linux-hwmon@vger.kernel.org>; Sat, 23 Jan 2021 08:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HyafWA/fguU4cRHnCu0cBiZhUMVnzefHIjHu7C+dDfw=;
        b=FlmaG4BIMjJEnDX+SaaTYvHFmZJTzViKbA32KZRFw4G61T/U9X4FJ3S6x90LUYiDA+
         nBpihWhhZhWaSkbfJ+QKEmG+x0P8Qj5H+jW9sW/yXr0+zCX2VgWcUUR/d/yYjD/0BCfv
         Kh/zFcdmH8DvhOCVi00mKNR1dmrkQFiMAFeplWQB6Nga4uvBJvfQqepepNbggAeUCke/
         T1ZUJWovgjDEG9Y2MLxsrrIt77KgzBfy4J5p95SaOqO0yNua2dO9+n/oFwDL6UcctBLy
         InoCmtay9Wexj8O/6JIqWvmHN7EtwojnOo3R4vBb1lUUt0nXcUqNjGrd8H/v9WyEfyYS
         VwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=HyafWA/fguU4cRHnCu0cBiZhUMVnzefHIjHu7C+dDfw=;
        b=THnWr1Q/f4eNl8VD8Rcbu53OPzCH2pXZnkcZswZxky0Cl0qurioi/CXc0EqhmHN1TU
         bsq6+Eh2WRfqHS0jTTgth9BaBt2wCWJPKh5KkpkBeQg+e5DASGfIdP3GACzDjj/dQmmF
         GLZcnb50wWQtsfoPiK0gMQvbXIrpRtk5PNj38I1oY60GFLIkIroOiTxhd0hplKip3WPi
         DKl7snP6rHlWKtK2iu4JJmF5kIyOiMvhsrpZPocQ72D9dI4HTgquRa6q/EnZRnS8h4kP
         o979jL6P3qBt0uMqifBhgX/v3Wh2Vy3g7/G2HxSLmDii0NoUxvrwUdI0npKaTDFOMBZg
         9rfg==
X-Gm-Message-State: AOAM5307P+pTv7h4+VJIru6xsEFGm2d1VIkbigTcy7EOLEEvwbxloc+C
        PO/upzVpkeWsVW/txl0sbqWfAKu6dmI=
X-Google-Smtp-Source: ABdhPJxGp5o/imfWjL0i5ZzjuE0+uCR96WFeESH0KWV0fka9fENlSFYH8qJe0XAQv7s9r+QjBKyvxQ==
X-Received: by 2002:a05:6830:90a:: with SMTP id v10mr7079609ott.364.1611418138235;
        Sat, 23 Jan 2021 08:08:58 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i9sm2422335oii.34.2021.01.23.08.08.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 08:08:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 23 Jan 2021 08:08:56 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Johannes Cornelis Draaijer (datdenkikniet)" <jcdra1@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, delvare@suse.com
Subject: Re: [PATCH v3] hwmon: Add AHT10 Temperature and Humidity Sensor
 Driver
Message-ID: <20210123160856.GA50415@roeck-us.net>
References: <20210107194014.GA88780@desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210107194014.GA88780@desktop>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jan 07, 2021 at 08:40:14PM +0100, Johannes Cornelis Draaijer (datdenkikniet) wrote:
> This patch adds a hwmon driver for the AHT10 Temperature and
> Humidity sensor. It has a maximum sample rate, as the datasheet
> states that the chip may heat up if it is sampled more than once
> every two seconds.
> 
> Has been tested a to work on a raspberrypi0w
> 
> Changes from v2:
> Add reference to documentation to index.rst
> Properly align defines
> Clamp value instead of returning error
> Adjust return values
> Remove unnecessary print, check and comment
> 
> Major changes from initial patch:
> Removed devicetree/of references
> Removed aht10_reset, aht10_remove
> Add documentation
> Switch to hwmon channels, attributes and info
> More appropriate usage of mutex
> Return standard error codes
> Add checking statements for errors that are returned
> Other code improvements as suggested
> 
> Signed-off-by: Johannes Cornelis Draaijer (datdenkikniet) <jcdra1@gmail.com>

Applied.

Thanks,
Guenter
