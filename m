Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 357A5C433DB
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Dec 2020 06:08:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF84E23120
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Dec 2020 06:08:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725782AbgLVGIn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Dec 2020 01:08:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgLVGIn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Dec 2020 01:08:43 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09469C0613D3;
        Mon, 21 Dec 2020 22:08:03 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id j12so10991993ota.7;
        Mon, 21 Dec 2020 22:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/n9Ap6EeFpbRzKoVrmu/gD4gln7ecbkmSoH0SKatugo=;
        b=i4x4idCaiOnpRB4QSH+TPJ+Idz/fmiib2yJ4dxlQGuI4YHIxIwRF5hOsygFeYghLYV
         QIWJ7cd19O62QB3/O2pm+z+0ZAcmbdAWgGiyd77evgeV73O5ERD+6E2SLzxFUAY5eU2l
         vweAWkD3+GCqyYP3wPT/vQPHgV61bTLX36e6cNKYMVsEb4WMMLh2qT8gMlAVj3JwCOda
         aJkEYy8tRrKRMK5dO49O83COwEueylxon79Kos6kstRmW7DPrJIjg7ecv9s8VQEBJ2ns
         /a9QV6b4xNaAlGXgfUyp9q76v6grekkm2Vt2iKfEzsTGqwkzLa8L1CEXFj+tY5SmcNFO
         8Chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=/n9Ap6EeFpbRzKoVrmu/gD4gln7ecbkmSoH0SKatugo=;
        b=tbbL8atvWPiA24p5ubUC9JBxsWJHb/gi83U7Ghdt+gniJnNz40ZwcKx1qYOZQm5qQD
         S1CkAJ5mIwBLweEBGDOBf3QhIo0qCgQJmu9O5+vKowm+2u5jQFVL/UiOAsg2PYbVRVO/
         Ro8IUJWa9bLOzIpF0kXsYodnYrOy4FbZqB9gwiolnI+YonZpOGi/bsHDFSISv+ByX2ek
         gP64Wn9tlVDI/ck+fjoGMi5R4acNNDI/3r1nxcKJOZD5xXiC8vfRQqvUKjG3NLcRY2eR
         PXFWmJ7HlPyFsimDJnrYgtCnJEVqJ9NuQJQNb4Dns8ncqzVYu0psQBDfC86k3VAAvn2E
         rpbA==
X-Gm-Message-State: AOAM531C8AKNMy/X1vcYu1+8lgYV63LrJXGWbtdUNTjrFaJAOgxhEwlp
        l97SLfFpENVLIQ3brZ1ynxk=
X-Google-Smtp-Source: ABdhPJzALnrmD+/Ku/gUsCwgkOE2ovPJeiBgTqVauMAyKdmqrgt921HF3kS9nJXYBhyxKboCwD29jQ==
X-Received: by 2002:a9d:7857:: with SMTP id c23mr14427256otm.298.1608617282337;
        Mon, 21 Dec 2020 22:08:02 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 69sm3248782otc.76.2020.12.21.22.08.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Dec 2020 22:08:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 21 Dec 2020 22:07:59 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Gabriel C <nix.or.die@googlemail.com>
Cc:     linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Wei Huang <wei.huang2@amd.com>
Subject: Re: k10temp: ZEN3 readings are broken
Message-ID: <20201222060759.GA76917@roeck-us.net>
References: <CAEJqkgiiU7miC13iT6DufjFAsHkNZk6rBAw=KRRnHe47kTZDnw@mail.gmail.com>
 <9d621d34-e5ce-301a-1b89-92c0791fe348@roeck-us.net>
 <CAEJqkgjFVBEDxCVB+P3CjirRkCZW1_6s18AgOKpe+6er3VShpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEJqkgjFVBEDxCVB+P3CjirRkCZW1_6s18AgOKpe+6er3VShpA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Dec 22, 2020 at 05:33:17AM +0100, Gabriel C wrote:
> 
> ( BTW off-topic this amd_energ driver should be removed or depend on BROKEN,
> since is working as root only and breaks the sensors command output )
> 

That is because of a security issue. It just needs to be reworked
to cache readings for a while to avoid that. Any volunteers ?

Guenter
