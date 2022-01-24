Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC52C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Jan 2022 16:24:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243618AbiAXQY1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Jan 2022 11:24:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243021AbiAXQYY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Jan 2022 11:24:24 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E06EC06173B
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Jan 2022 08:24:24 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id s185so9462116oie.3
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Jan 2022 08:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MT4xDDjUxyF80nYtx1BG4ritxdHQ1sNzk/TBHWyfKag=;
        b=R7hnj3dzg4n9i1eTW320wXIjY6dEUuQFXV4X//M46vvB8QAH6bLrTHo5Pxpd7sxBXu
         NF6LKrsvVi/56py4xOe+xBAIbl/BCgbZn3KTlPx0zkjfr/HzkJaWuRWgiTKwU6IHUi3q
         FFN4Js8U0N8ZbDfYXvcnBs5fMi6wP1aFJhxhyGRImZq3ez2yj/FYf6mblmsk/WRIWAaf
         qogybyMspYzsE+Ms17q1eVwiyuKe0H3eBs0K/waxyDASX3r+o7C+i0HXfFcgdY1wTsQN
         r+YBM57ih6a3qdyL7Ml14zS4GyA9SIk0Q/IC6tHAeQXehhBe4JQzhmPLKmCjWb6tV5f5
         JDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=MT4xDDjUxyF80nYtx1BG4ritxdHQ1sNzk/TBHWyfKag=;
        b=G0QOJ6JYur0wM/3ntGQWbgxmL/qa71ILjz9t3ZRrfKfOvCAs2XjGdblnot/O9akcgP
         2VjpL2gW5i+H65DdI5S/RQ4YSikCVm19ykzDD7wsQ380+BAqkMfp2EKDQZKL5C32ieN1
         Hr3D+8Aeka3DBIDz2hgtmksmsXPjNEcr6OZxVlLgciR8EUDEIDNS/xg74SQozYszS5yG
         lqLbxc4n6mP+voVsFSzCmSBvP81q5Etu9NdvketYUcELEnxltI4BsL7zbL8Nvz537Inq
         OF97+Ef8rG1ZHORcBNvftyp1fJwNnuCW4yHoJ3kkj6OERyDoef7DclsG+7gfaV4DlGmq
         QT1w==
X-Gm-Message-State: AOAM533/CFq3p/ecLG/G5/rlyVRhvvGjE9f5Yr0nbz++2MHIRiAdbUBq
        FGJuB2xMEz6ilObzJYWwrTHAdo1UG34=
X-Google-Smtp-Source: ABdhPJw5DeYAYhKGEqFCNy6dpElFNJqEKDPq77xwjt2Crv5GOkecpmWycz5AvHaQr6TPXNr7eZmqLQ==
X-Received: by 2002:a05:6808:88:: with SMTP id s8mr1643928oic.11.1643041463482;
        Mon, 24 Jan 2022 08:24:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h1sm362010otl.37.2022.01.24.08.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 08:24:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 24 Jan 2022 08:24:21 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Michael Shych <michaelsh@nvidia.com>
Cc:     linux-hwmon@vger.kernel.org, vadimp@nvidia.com
Subject: Re: : hwmon: powr1220: Fix warning found by kernel test robot
Message-ID: <20220124162421.GA3536909@roeck-us.net>
References: <20220124152624.11004-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124152624.11004-1-michaelsh@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jan 24, 2022 at 05:26:24PM +0200, Michael Shych wrote:
> Add missing break in case statement.
> 
> Fixes: 19d8ebde2889 ("hwmon: (powr1220) Upgrade driver to support hwmon info infrastructure")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Michael Shych <michaelsh@nvidia.com>

Squashed into the patch introducing the problem.

Thanks,
Guenter

> ---
>  drivers/hwmon/powr1220.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/powr1220.c b/drivers/hwmon/powr1220.c
> index 6fa4ddbc1a41..f77dc6db31ac 100644
> --- a/drivers/hwmon/powr1220.c
> +++ b/drivers/hwmon/powr1220.c
> @@ -189,7 +189,7 @@ powr1220_is_visible(const void *data, enum hwmon_sensor_types type, u32
>  		default:
>  			break;
>  		}
> -
> +		break;
>  	default:
>  		break;
>  	}
