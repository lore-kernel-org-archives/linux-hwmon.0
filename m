Return-Path: <SRS0=YFue=3U=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0ABC2D0DB
	for <linux-hwmon@archiver.kernel.org>; Fri, 31 Jan 2020 21:53:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C023020705
	for <linux-hwmon@archiver.kernel.org>; Fri, 31 Jan 2020 21:53:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=comcast.net header.i=@comcast.net header.b="bhjjVnju"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgAaVxx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 31 Jan 2020 16:53:53 -0500
Received: from resqmta-ch2-10v.sys.comcast.net ([69.252.207.42]:51659 "EHLO
        resqmta-ch2-10v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726138AbgAaVxx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 31 Jan 2020 16:53:53 -0500
X-Greylist: delayed 488 seconds by postgrey-1.27 at vger.kernel.org; Fri, 31 Jan 2020 16:53:53 EST
Received: from resomta-ch2-16v.sys.comcast.net ([69.252.207.112])
        by resqmta-ch2-10v.sys.comcast.net with ESMTP
        id xe5tieP0wQCNTxe6iiGFvQ; Fri, 31 Jan 2020 21:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
        s=20190202a; t=1580507144;
        bh=bbM+xbPrcQzKcjcG2eUnCxfyLPDdWTXe+t8VPwkhhTc=;
        h=Received:Received:Date:From:To:Subject:Message-ID:MIME-Version:
         Content-Type;
        b=bhjjVnjurwzsc0oj22gWVQcPoQZ/otD0nFu7ir9kZN/40I1dlIrn0QNACeZMa5k9P
         1HSgNPOG8Fd0MeZopzIjA+coKV9jA2AaKkg5nKqYU6EfI46uKKj5ypspdMy1Vba7lP
         g9ESSQPyXprAILCcHjaryOSAqlbhU3DtnN3l0uh+4P3f6i3h+hDHff7SZPKKPaMJQQ
         xW2dH4SD2RlwCQfAbxx/HIyaoK8j5q3GY6hXtQvkvbJJ6y1Pp+sDpL180iPObrMOpM
         biX0tozOvMOX9wdiAx/QKtl9bO1OK70+zjPVkwowmgMnfUUr2Y4iIDXY1bFIHqP/K7
         pJEfxGPPDL97Q==
Received: from apadpagan ([73.45.177.140])
        by resomta-ch2-16v.sys.comcast.net with ESMTPSA
        id xe6hiAN9M3TL0xe6ii7Jcw; Fri, 31 Jan 2020 21:45:44 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgedugedrgedtgddugeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvehomhgtrghsthdqtfgvshhipdfqfgfvpdfpqffurfetoffkrfenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkohfogggtgfesthejredtredtvdenucfhrhhomhepufhtvghvvghnucfmuhgthhgrrhiihihkuceoshhtvhhrpgekkeekkeestghomhgtrghsthdrnhgvtheqnecukfhppeejfedrgeehrddujeejrddugedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheprghprgguphgrghgrnhdpihhnvghtpeejfedrgeehrddujeejrddugedtpdhmrghilhhfrhhomhepshhtvhhrpgekkeekkeestghomhgtrghsthdrnhgvthdprhgtphhtthhopehlihhnuhigqdhhfihmohhnsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-Xfinity-VMeta: sc=0.00;st=legit
Date:   Fri, 31 Jan 2020 15:45:43 -0600
From:   Steven Kucharzyk <stvr_8888@comcast.net>
To:     linux-hwmon@vger.kernel.org
Subject: Help Query
Message-ID: <20200131154543.1ce270a8.stvr_8888@comcast.net>
Organization: Traveling
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Sorry to ask and if not you may you tell which group or person would be
better suited to deal with this.

Q. (spec's follow)
the Short of it:

I upgraded my cpu and lost temperature reading via "sensors" cmd on my
video card. Output shows card with a constant +0.0C while card control
app shows true temperatures. Is there something I can do to correct the
problem?

Thank you for time 
Steven


Spec's:

	MB: 		Asus M4A89GTD PRO
Original CPU: 	AMD Athlon II X3
Replacement: 	AMD Phenom II X6
Graphics:		Nvidia GTX650
	O/S		openSuSE 15.1

-- 
--- --- --- --- --- --- --- --- 
This e-mail message may contain privileged and/or confidential
information, and is intended to be received only by persons entitled to
receive such information. If you have received this e-mail in error,
please notify the sender immediately or you may suffer consequences by
wrongful association. You are Advised to: delete it and all attachments
from any servers, hard drives or any other media. As a non-designated
recipient - any other use of this e-mail by you is strictly prohibited.
This email is subject to the control, laws and regulations of the
United States.
--- --- --- --- --- --- --- ---
