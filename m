Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3F0C64EC7
	for <linux-hwmon@archiver.kernel.org>; Sat, 25 Feb 2023 15:09:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjBYPJU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 25 Feb 2023 10:09:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjBYPJT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 25 Feb 2023 10:09:19 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7BBF125BF;
        Sat, 25 Feb 2023 07:09:18 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id e18-20020a0568301e5200b00690e6abbf3fso1216193otj.13;
        Sat, 25 Feb 2023 07:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qNa/fooWw1RTkDA5x2nPD4n+HhSBqh6xjuBoYlXOMg=;
        b=TuPc863yMH4JTt9dbtQobY+RHxL+miLSJwTxuEADKjwPYiT5YAXBV44JN6iL9zI0kk
         60KlRj3s2jH7NqYnLz90C/w3UUk3IziGKve55Fjfw3aSTmB9Bmci77HuMwN/9Dql1tn1
         Va2tzQr4+nHShc0q6emwHAhVdP0ZNx9ZqBEF8DkN9TxRvVTjkWhzBXhvmbyKtqC/t8CU
         daqHA6zD3e2CKSsq7bffm6C7rW4e+GN6X12p/ebmNcgk5t3Uw34cO1n+pHGkSqZJ0I5u
         B4+2KBk27EEgg7rT+/k2jCKYGIQgi88TmeulRHzn3AImlQ+vfHqJix9b470NHsg2faYr
         APEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qNa/fooWw1RTkDA5x2nPD4n+HhSBqh6xjuBoYlXOMg=;
        b=vg+FbHTJbhdVPtI3DDJVEb3yMx5qHCWtWAg+LMkDMMmC6QuGgNA1LW8aoO5cBghOAi
         IztXD/Ia6WU3TMDdyhHcekxnwk1UYQ5nGjfjbzx8OpMefPj6nNenBgrS9hP/5dxqNdjj
         AaN+yV1zTtn/3+vC24cvOUjNOSlE43puqEanYs50AzICHf27Pt6R533JJdGcSHLJv6NG
         6Y8MfGx22dF2l2XT+84lVFtSW/03/F6KtK5idVoZGi+bWumEqlg3Qx9jxZS5xCTSzaYr
         kEsPaJNiEzigl+bolIZ5Zh2ZmNEjr18zAx+oLvDf5BDhsaxr2Cp4OpK1K561t0R7/orI
         1Mbg==
X-Gm-Message-State: AO0yUKX9UUTyVj2rFT4p48Wepf8K07lWVxWtHM+S4CgGfU7V4bHF0YNe
        u5w2ri+Gv3Zo6kEreZSZRIkpaIgUQaI=
X-Google-Smtp-Source: AK7set/SC2YZfRGXbGQ4gF7WuU53OTprrlHKykxjKZD5466hH4VTsscuqo80n7PmEi0ziIBxnCSMKw==
X-Received: by 2002:a9d:6087:0:b0:693:bf8d:379b with SMTP id m7-20020a9d6087000000b00693bf8d379bmr8778659otj.34.1677337758065;
        Sat, 25 Feb 2023 07:09:18 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bt55-20020a05683039f700b0068abc8e786fsm691533otb.10.2023.02.25.07.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 07:09:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 25 Feb 2023 07:09:16 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Zev Weiss <zev@bewilderbeest.net>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v1 1/1] hwmon: (nct6775) Drop unneeded casting and
 conjunction
Message-ID: <20230225150916.GA3888060@roeck-us.net>
References: <20230217191600.24837-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217191600.24837-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Feb 17, 2023 at 09:16:00PM +0200, Andy Shevchenko wrote:
> The 64-bit result will be cut to 32-bit automatically (by compiler)
> due to the type of the destination value. No need to have an explicit
> casting and especially additional conjunction which does the same.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to hwmon-next.

Thanks,
Guenter
