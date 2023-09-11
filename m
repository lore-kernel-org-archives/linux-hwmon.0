Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F57C71153
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Sep 2023 00:54:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbjIKAyJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 10 Sep 2023 20:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjIKAyI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 10 Sep 2023 20:54:08 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B85B180;
        Sun, 10 Sep 2023 17:54:04 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-68fbd31d9ddso330929b3a.0;
        Sun, 10 Sep 2023 17:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694393644; x=1694998444; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OXPRwoE/5j2VaATH6F7GihPkYHxjlgr3ytJC2dVXsG8=;
        b=MiMdorzej1Suo8zFBX6yFQcIePQU6txkHnlq0BXeN68/5tUwZvRZ53t9E0oGAlSfyi
         Cj9M4qW1eruY1c/PlHJo3ogzMCarr6QPeu3iXabUeXIQC0aZLLLyjoyuNrDlV8hIlZls
         dGG2JwpxAOMbTifzTFjQXPEV4wiuJbXCbpRXWP6+6fyDMnySlTCjXo4xNQLq4f1u0cFY
         erM23Ft4xUfB72PMlbvLvYwrahWZKWcO/1AjJ6QNtP4WVZQnJnC3Cut0hBI25B2g1qOl
         1bCzfyYYCCYFlI2qRVP+FlKJRuE8I1+LdZAYYDBYiLO34nouHOZ8vh+EvSG17l8XJx5O
         s1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694393644; x=1694998444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXPRwoE/5j2VaATH6F7GihPkYHxjlgr3ytJC2dVXsG8=;
        b=MV7CnuYXj2dBukGU2nVl6USTom9dwCNfF62vA9KpwDTsYyEs4q1RAib3tWqKKnvMhn
         WFfIVNRbHbGrW0DyKmGxXz2Vp/kf5k3CovhrBKhmG3tbddVuJ87AS4ujchjKbpiTVPSy
         6hjVWwLrxI6NaWYbLSsO6rUh6lnaHpkaeDgMVUIdunJ4+Cke7Cppx8G9FIQswzCmAuJq
         pAEfoEBHrtm8/d2ip2XUUc+5gOJ17QncKYPR6i9LZ3aUYbH5WUbrNd527mV65HVk5USU
         7HSz4XbSnmvNTe7db6ZZdbguRdCfKsViqjMa870S2jvdH9zezSJ0xUHLQbGjQcLlMHbK
         mUww==
X-Gm-Message-State: AOJu0YwX/2lYbbhBEzdponC5kP4VENDf9RUByaa5FnVkFV17GQwGxt8c
        mQB+TA1A1lzkpUGa/uaWaFg=
X-Google-Smtp-Source: AGHT+IGjSouv5Q0od3H9iNWEf8vL8IK922WLda6yhIutpny/L9/CRb7NShU0385EKxQ2469vtmmnTQ==
X-Received: by 2002:a05:6a00:2393:b0:68e:380c:6b15 with SMTP id f19-20020a056a00239300b0068e380c6b15mr7052624pfc.26.1694393643884;
        Sun, 10 Sep 2023 17:54:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k65-20020a636f44000000b00565009a97f0sm4411112pgc.17.2023.09.10.17.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 17:54:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 10 Sep 2023 17:54:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] hwmon: (sch5627) Add support for writing limit
 registers
Message-ID: <6d358954-df43-40c6-a1d5-ff7ce5284d77@roeck-us.net>
References: <20230907052639.16491-1-W_Armin@gmx.de>
 <20230907052639.16491-5-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907052639.16491-5-W_Armin@gmx.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 07, 2023 at 07:26:38AM +0200, Armin Wolf wrote:
> After some testing on a Fujitsu Esprimo P720, it turned out that
> the limit registers are indeed writable and affect the fan control
> algorithm. This is supported by the datasheet, which says that the
> fan control functions are based on the limit and parameter registers.
> Since accessing those registers is very inefficient, the existing
> regmap cache is used to cache those registers values.
> 
> Tested on a Fujitsu Esprimo P720.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied.

Thanks,
Guenter
