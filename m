Return-Path: <SRS0=nCRF=AQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F545C433E0
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jul 2020 11:47:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 502FE20771
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jul 2020 11:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593949642;
	bh=cu2efO4LfsSLyL7t20RxzfjBKPYER/0iFNfqtgPIZx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Mbk+KFPNbO4ivaxStwy6bq963reBOuB/D0gIGHzrD686RujMAujn8dmMMSh/+ArCN
	 DZLKLP5fn31fr0LEEfrtbMNJbyq2CE1kptsx7ejO5i9ELdWOoWIxNNfEcNMVWj8ung
	 uBZ9cEyFMsrD3vNeyLAQT6wgdnnc3lsXHU6Oq4+g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbgGELrS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jul 2020 07:47:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:55316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726454AbgGELrS (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 5 Jul 2020 07:47:18 -0400
Received: from kernel.org (unknown [87.71.40.38])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3B95820723;
        Sun,  5 Jul 2020 11:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593949638;
        bh=cu2efO4LfsSLyL7t20RxzfjBKPYER/0iFNfqtgPIZx0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DRWLMT2r5bC6zUcmX7O/4Sjzym6prvAsWsCFzkLkbqRSvSia14fyXDEkUFU7mEV+1
         0lQ/Wygf5PfnkNJ0EqM5gOtLiN55JHAvRxfhW6IeadKqEX2hoJylPMrBA6/BwZe0Mz
         JLKX+/gSxWqaXwISi2MfJe2BIcsVcO5BOkVMK6sg=
Date:   Sun, 5 Jul 2020 14:47:12 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 0/5] Documenation: hwmon: eliminate doubled words
Message-ID: <20200705114712.GF2999148@kernel.org>
References: <20200703205649.30125-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703205649.30125-1-rdunlap@infradead.org>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jul 03, 2020 at 01:56:44PM -0700, Randy Dunlap wrote:
> Eliminate duplicated words in Documentation/hwmon/ files.
> 
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> 
>  Documentation/hwmon/f71882fg.rst  |    2 +-
>  Documentation/hwmon/lm93.rst      |    2 +-
>  Documentation/hwmon/nct6775.rst   |    2 +-
>  Documentation/hwmon/w83627ehf.rst |    2 +-
>  Documentation/hwmon/w83l786ng.rst |    2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)

-- 
Sincerely yours,
Mike.
