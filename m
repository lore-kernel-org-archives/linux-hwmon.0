Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED53C3F6B0
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Aug 2022 09:52:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234059AbiHPJwk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 16 Aug 2022 05:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234037AbiHPJwS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 16 Aug 2022 05:52:18 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5D66B150;
        Tue, 16 Aug 2022 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=jJXEgeaJgW7E5rB/ZAtJ1t8ALHPRvklP1BF3O1zV+CQ=; b=DwPb9TQYje+3EXZb/buozWluyT
        C5h0P+Qnt6B3GaSdNEkuJAN0xQqQxafG7KXJCDu+xW1nssPeuZ6NP+qFSYeVV7jbS8jJR2VyusssH
        D9HJuouRI47ahhNx6DYn9o4fxad2L07UAex24+n7ULGhRjU7KE6M8hTTK+DPwKyjaiC9O6myqSQWX
        ZY6wMlHyrIdibAw2BoWIMwinf/yNTQ9DCYa05Xt7DwvPhVeU9l0YGraOS1vMpo4wU3fwJuKz7LdRe
        BZuNPT+wxmp9PSkF8JRfgaoWp031E1Jf9bX9if+CK2MevaDW5LsBR1a+06UV4QV7gzbp22/aAveh8
        /JZFH+Ow==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=worktop.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oNruj-002uJo-OA; Tue, 16 Aug 2022 08:27:06 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
        id 5A572980264; Tue, 16 Aug 2022 10:27:05 +0200 (CEST)
Date:   Tue, 16 Aug 2022 10:27:05 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Zhang Rui <rui.zhang@intel.com>
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-hwmon@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
        corbet@lwn.net, fenghua.yu@intel.com, jdelvare@suse.com,
        linux@roeck-us.net, len.brown@intel.com
Subject: Re: [PATCH V2 1/8] perf/x86/intel/P4: Fix smp_num_siblings usage
Message-ID: <YvtU2VKtpGCIOes4@worktop.programming.kicks-ass.net>
References: <20220816051633.17775-1-rui.zhang@intel.com>
 <20220816051633.17775-2-rui.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816051633.17775-2-rui.zhang@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Aug 16, 2022 at 01:16:26PM +0800, Zhang Rui wrote:
> smp_num_siblings can be larger than 2.
> 
> Any value larger than 1 suggests HT is supported.

Subject and Changelog are still utterly insane.
