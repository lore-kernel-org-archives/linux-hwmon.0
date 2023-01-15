Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30085C63797
	for <linux-hwmon@archiver.kernel.org>; Sun, 15 Jan 2023 16:20:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbjAOQUF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 15 Jan 2023 11:20:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbjAOQUC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 15 Jan 2023 11:20:02 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC39CC3C
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Jan 2023 08:20:02 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id d6-20020a056830138600b0068585c52f86so305698otq.4
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Jan 2023 08:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDeQycTByzPfOLw+Cf8dPzpUsgcgImgbA5BApntH61Q=;
        b=NJwhleRV8suKuqYlyq+RlAn1J3/CAVNkSg1BE3at+oYTS5MEM50I5/T+iQAHk83BmJ
         PSrfThKget8ldWqdJdHCAtIJR1f/aG97g+XCgh3ukb5syulQMiI433CH4wytyFvdU4qG
         V92U687JEQnNZiXy3WpyT0H+zVy+qEmZSQ9tEJM56MssSyZTGBYf9RJV9SnYKj13WPs1
         lGW7Eu8vMojXHeqMwnjDCUrU1hzM9tnWR9Lxt+Nr8nSYmfnR8+iV7iEq9dSG2nEnM9V1
         OHH1VNY5bXelGWi0SgWo2bM/gw8lJ7xwp4GZyJfE4bYnNrg7u7PzaRQkRCe6zJgkj5eo
         j7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDeQycTByzPfOLw+Cf8dPzpUsgcgImgbA5BApntH61Q=;
        b=RR5aJ1WntpKkvTUNmC8GuTSfNqUFR7R3THtJWbh53aQZR3PEa7/I+jSankIu22LrJl
         o4XwoXrhIsWWpTZbU/fdRCm3QENxJbIkUcTbWU3RX176tdt+0/KSoLbvqCQlJobNw7kM
         2cxsIfbJ129bS2YcNR3xv3DLB3McFN5xIZ/USrNka2Gwmm0bNkJA0iMOcnwYCeB9QlOD
         mpk2RZjBcCvZPk4P0hnO6yHk8HMYwgufBsVHhGPT4eBBdig3l8KuglGOl9Xi1gvozZPQ
         gQ8g3gg6Kmk9RsJPA2nccennmnuF29pCd8TqnF2Q/Kh+DBpOrY1EHfJfDFgOlQyO2qB6
         aqTA==
X-Gm-Message-State: AFqh2kp/wvgF4Qqh152WfptaKD2tHYFapSr9f2bQMQgvUYixfi3lEDhw
        LpPQbB0EJQ2RIehxqwUc76KuD5vhqts=
X-Google-Smtp-Source: AMrXdXvRVlrqYIKZWvvI/ggYBJV5jpCkYsGv1jhJq5a4fd/b/V7bZ25bO48fYb3/YFHCAq50ghT5Pw==
X-Received: by 2002:a9d:12c5:0:b0:684:ba4f:deb0 with SMTP id g63-20020a9d12c5000000b00684ba4fdeb0mr8080664otg.22.1673799601722;
        Sun, 15 Jan 2023 08:20:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n9-20020a9d6f09000000b00684e3182294sm1741889otq.55.2023.01.15.08.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 08:20:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 15 Jan 2023 08:20:00 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (it87) Set second Super-IO chip in
 configuration mode
Message-ID: <20230115162000.GA1247300@roeck-us.net>
References: <20230104060926.619686-1-frank@crawford.emu.id.au>
 <20230104060926.619686-3-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104060926.619686-3-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jan 04, 2023 at 05:09:26PM +1100, Frank Crawford wrote:
> On various Gigabyte AM4 boards (AB350, AX370), the second Super-IO chip
> (IT8792E) needs to be in configuration mode before accessing the first
> due to a bug in IT8792E which otherwise results in LPC bus access errors.
> This needs to be done before accessing the first Super-IO chip since
> the second chip may have been accessed prior to loading this driver.
> 
> The problem is also reported to affect IT8795E, which is used on X299 boards
> and has the same chip ID as IT8792E (0x8733). It also appears to affect
> systems with IT8790E, which is used on some Z97X-Gaming boards as well as
> Z87X-OC, and other more recent Gigabyte boards.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

Applied to hwmon-next.

Thanks,
Guenter
