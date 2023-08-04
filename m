Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5E9C001DB
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Aug 2023 15:26:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232062AbjHDP0o (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Aug 2023 11:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232073AbjHDP0X (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 Aug 2023 11:26:23 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BB444C1E
        for <linux-hwmon@vger.kernel.org>; Fri,  4 Aug 2023 08:25:49 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b9c5e07c1bso19257175ad.2
        for <linux-hwmon@vger.kernel.org>; Fri, 04 Aug 2023 08:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691162741; x=1691767541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+BCi8R/h3ND2l8+40GiDGE1lzkocYG9oaDhbR64AN8=;
        b=n+ZxbVqaBlGOJch18iQoNzrPN+vnVKNsw3SLLeYwU6vMyIgHts9KM0nM9DzYNY8OF5
         N+0lpJ/QeB70AQiDLyPfRRQx8S4CCmutKJgohn61+J8lfH7r2eQ5iLPIAqMbFqlXjOLR
         kgWIBF9MiI9eZhpSkL7J4bunIEg6B4CaS0nHuHa8NdOsKGkyXtU0spCKUqHu4JEj+n2V
         CSquyoohvz6a6va/rZ/eO8KftbC396Aq4jFtPuQYJlgPSG879Bg0et/3rHOx4+IRgEbm
         URY6BFcc81yumvO8zGMiG1cS3zquJIFtFwabTxxbbRDP1jyq45gaV2uHVY4HW9DvxOs1
         fzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691162741; x=1691767541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+BCi8R/h3ND2l8+40GiDGE1lzkocYG9oaDhbR64AN8=;
        b=fcEnlkP/ct+v6ROGgzzAXw63dFg0kxezj4Z8fVhxJH2TDX2MFNXuUWqTYdknGZdpyN
         eL6Puikbxq99sFSb0XuG0gZ4qdJ2oVYiWBFpwr6PSTSbhIxkEBoxVtWy/KxTTrfgqp4j
         EzgGrprlWKTT6Qit18ZLN62e9rFz7MJhHBQEpVBCq3NQ9/NM0rJKxQQB3uXZjBXmQT+S
         YQGA3CNf5W0gRbeoqrRpp7lHQZ+X9stQHk//cF/t42/nflssUwXqc9V+0CWJcVHZl7l2
         inStPKamqEqHnh+J62YvxYxV63ELnOavR8CURpXrYiX18Ph300QfXxDkVeyopmH2StU8
         U5KQ==
X-Gm-Message-State: AOJu0YxSUvoluJw20lMgKm7txwPg7Hycn/G6ZbJCkI7C87DTZ2jIu8GB
        /PkUJLTtjKggsynxd7DpVCmB9zh3e0E=
X-Google-Smtp-Source: AGHT+IHTMBoiOj9dgXrUkcF8QW/eMA5/zpYf8NRJsgCNImn6DIgtotQXuSr8jKEexyfcyj7MyMBnMw==
X-Received: by 2002:a17:903:32ce:b0:1bc:210d:635f with SMTP id i14-20020a17090332ce00b001bc210d635fmr2379756plr.28.1691162741572;
        Fri, 04 Aug 2023 08:25:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b14-20020a170902650e00b001bba3650448sm1912249plk.258.2023.08.04.08.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 08:25:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 4 Aug 2023 08:25:39 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Khalifa <ahmad@khalifa.ws>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) Additional TEMP registers for nct6799
Message-ID: <5b08168e-b9ed-4666-9552-5336393cee95@roeck-us.net>
References: <20230802185820.3642399-1-ahmad@khalifa.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802185820.3642399-1-ahmad@khalifa.ws>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Aug 02, 2023 at 07:58:21PM +0100, Ahmad Khalifa wrote:
> Additional TEMP registers for nct6798d, nct6799d-r and nct6796d-s
> This allows the max/max_hyst/crit attributes to be shown/stored
> 
> * Increase NUM_TEMP from 10 to 12
> * Separate TEMP/MON_TEMP/OVER/HYST/CRIT registers
> * Rename "PECI Calibration" to include "TSI" too
> * Update ALARM/BEEP bits for temps for 6799
> * For 6799, keep temp_fixed_num at 6, but increase
>   num_temp_alarms/num_temp_beeps to 7/8
> 
> Tested with NCT6799D-R showing additional sysfs attributes:
> * temp3-temp8: max/max_hyst/beep/alarm
> * temp3-temp6: crit/offset
> 
> Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>

Thanks a lot for looking into this.

Applied.

Thanks,
Guenter
