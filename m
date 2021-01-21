Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6007DC433DB
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Jan 2021 19:27:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13FFD23A22
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Jan 2021 19:27:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbhAUT1M (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Jan 2021 14:27:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727434AbhAUT0b (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Jan 2021 14:26:31 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C520BC06174A;
        Thu, 21 Jan 2021 11:25:49 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id d1so2700349otl.13;
        Thu, 21 Jan 2021 11:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=BBs9+OAZ+blXsQQplYQzJgH1rygI++hcNvA+VEiZKXw=;
        b=GKqWLN+LddB4cC1zQBHrvRcmBpH8ottF57SYNctmJLAvCYShu3xOan+mALIMPtDLh3
         CUBTWSbMjqY7tG3O9Dsm+n6RTd37PP+jBSWNEusjjZ4vjMMaj9fu2gWcsAXPN7z5qgsH
         cNq0hDag5wHtreby1/WB1Fw6BLQeVp4etOqBjp1rHmo7tHeOCO1wxnZEVQjFDmRMyFL8
         j5sQqk98tnpoQiP+KDRsWYXyuAAwU5n29PBNAHOtKXX5GVIBAi2aDrLRM8CDgxwkqjFX
         QThJngMdw7lPnkkx8GbMF031H8Mo0BuPsFEoHQqrEfZN1OGncE6RhimWVutSd7DEisuE
         x+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=BBs9+OAZ+blXsQQplYQzJgH1rygI++hcNvA+VEiZKXw=;
        b=KTD6O/E+vz1gjqxhNaZM9c7xRpycBn31U+lB0QJWc07TENMuW1VnbT7CjebSEAJgzv
         vNgOPvfHF/0PzszWIvwr95seEA6iU1usmm4GzphqAkttbr/kU5Z0VJ9JXiTD3t5XBkk1
         lfEDaxRTLKG6aQKVukH6OLUDTl/8k+wiE/nSgh7erWn/s20rd38GD7VCLxd5hfAkDkiu
         k4nrxSd/9BU8KNOKP8g5SOJLxu6wbQV/x3QPv2UfBAkOedL31kgi0MqMcgrSXWZJGnfV
         huD+IfyVzeq4VUTsbTXy7elOvraVvhYQSMDGBxFdLWZhZzdWYiI8RmwB4eMml1M1DJwf
         rMQA==
X-Gm-Message-State: AOAM530v1bMFD9Q5jjK3H99RBQy2PHubOwnszQVmMhkRkYYx1BaOezWC
        6E5H9Q+IrI/LXV6aOjwhWC61JsiSiBE=
X-Google-Smtp-Source: ABdhPJwM1riziVn9oJRDBEMqjnNJP97k+c2PZFkraSXl9Tti7Xlx2LmcY6Ajr/zdBsanXahW1eYzEw==
X-Received: by 2002:a9d:62d9:: with SMTP id z25mr474886otk.315.1611257149308;
        Thu, 21 Jan 2021 11:25:49 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y35sm1227056otb.5.2021.01.21.11.25.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jan 2021 11:25:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 21 Jan 2021 11:25:47 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?utf-8?B?Qmxhxb4=?= Hrastnik <blaz@mxxn.io>
Cc:     Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: hwmon: (nct6683) Support ASRock boards.
Message-ID: <20210121192547.GA30724@roeck-us.net>
References: <b08d641c-3fb5-4845-85f7-e1753149cd7d@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b08d641c-3fb5-4845-85f7-e1753149cd7d@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jan 19, 2021 at 02:12:41PM +0900, Blaž Hrastnik wrote:
> Tested with ASRock X570 Phantom Gaming-ITX/TB3. It also appears
> on other ASRock boards.
> 
> Signed-off-by: Blaž Hrastnik <blaz@mxxn.io>

Applied.

Thanks,
Guenter
