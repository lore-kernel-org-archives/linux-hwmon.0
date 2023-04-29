Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACC5C77B7C
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 Apr 2023 14:45:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbjD2Ope (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Apr 2023 10:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbjD2Opd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Apr 2023 10:45:33 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DA4173F
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Apr 2023 07:45:32 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-63b60365f53so1276659b3a.0
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Apr 2023 07:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682779532; x=1685371532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lx8tuxnKKO2ocnkjlXwPFelJvCDG8yTDgKWzAHW3kPw=;
        b=YqVBDh/TdGlFxu9Lit0Ib2N7/z5Vf32LSV+lKFywSlb681WfXt3sZlf7L5JW0BAqjO
         vpTL7eS/k4R8602RNMm8wGv2wQTsW+6ooStwdPeMZXsR/ol8eTpNXoLhmkxzPemkah+C
         AJUdNXNMPFUfuwZxkfo5t5SaeU430RQf2GJb+YopjTx0xTOzVtDKpT9XwC3HXKq1LUBT
         cwTA6rIO5YvjFlR2jBarEv4A346bQQvcLD7Zgq3a4Q8W1dIL90NMhGTv17AHsh6LBKct
         tii+Jtz0fylSP6zepEh3l5vc5J7Q/c2Finj30LcH0d0IIOSmWslHpgbX6emm4/EJc5+f
         KtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682779532; x=1685371532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lx8tuxnKKO2ocnkjlXwPFelJvCDG8yTDgKWzAHW3kPw=;
        b=Rzg65v6qK7BXDns1IcYe1IitwkML2ywqvZl/1yIgcCPk1g2C5+wLD4lclKRVKLRNqS
         k9IHnAkLsWQhNMDhbh8lgI8vIzfqlENP/xY2WB7NAQUs/3t9UcUiE/Gjs8c54Gi4lDgo
         MWJergO9TDoPwZbd8oSPgXC270K7uuBJMhdcvJAu+G5PZ8Iu9bVgxgo8hQTnxmH9Vnw7
         acpvuiCBiiQyTlKEZZtPwJXeb/30F9x1rmD8uhGSf1/YSCszvcUL+1tTN0xBLkt4f98L
         ndhOEIDcOgWWNsdrXH5zQtYpcgf+xJeBfPHuLXd+0fxiS6ys+FbziHtn4fW81Z/XD8ef
         yJ+g==
X-Gm-Message-State: AC+VfDxJI4f/IDVFTVAdTgkspnjQEPLk7NdgVoNMJlV2qV/ytCfC5Ilm
        HI0Wf9NExaFp3kt1U/A56GE=
X-Google-Smtp-Source: ACHHUZ6iMaAixFH4gXvuBGZUThKBG+2XSW2ly6uKz7aiM9MEchoIZwPTprMpnCJJTEhSNuh9OSMc4w==
X-Received: by 2002:a05:6a00:a0a:b0:63f:1c78:4049 with SMTP id p10-20020a056a000a0a00b0063f1c784049mr10768210pfh.31.1682779532115;
        Sat, 29 Apr 2023 07:45:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o23-20020a637e57000000b0050bf1d1cdc8sm14650935pgn.21.2023.04.29.07.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 07:45:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 29 Apr 2023 07:45:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 2/3] hwmon: (it87) Add controls for chips with only 4
 PWMs
Message-ID: <8f1bb1e5-4a74-4627-875a-eae626f0c108@roeck-us.net>
References: <20230429115205.1547251-1-frank@crawford.emu.id.au>
 <20230429115205.1547251-3-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429115205.1547251-3-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Apr 29, 2023 at 09:52:04PM +1000, Frank Crawford wrote:
> Add feature and support for chips with only 4 PWMs.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

Applied to hwmon-next.

Thanks,
Guenter
