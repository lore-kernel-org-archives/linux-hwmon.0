Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4C1C4332F
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Nov 2023 13:22:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232448AbjKFNWe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Nov 2023 08:22:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232400AbjKFNWd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Nov 2023 08:22:33 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE5ED8
        for <linux-hwmon@vger.kernel.org>; Mon,  6 Nov 2023 05:22:30 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7161AC433C8;
        Mon,  6 Nov 2023 13:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1699276950;
        bh=bOVy01cbkkocR3h/hzt28aBJ2sYb6VVg03fJInUsWfY=;
        h=Date:From:To:Subject:From;
        b=UgWKsTUU3EjZCnm7BKhex0zkFk7XcqMOgjGhtNm355NzWrLngk72Rqv4cG4IySt1L
         uxS8nu7VQyYZCz9IIr0+SyH3Gg9O8g8vUyD6dnfLfsBwISkIkeEPczUcM3NngVAFh3
         e4Uz1UYXgGPUKmQth3293RAVHtO2P5ndMxYxbDMg=
Date:   Mon, 6 Nov 2023 08:22:29 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     linux-hwmon@vger.kernel.org
Subject: PSA: migrating linux-hwmon to new vger infrastructure
Message-ID: <20231106-hot-handsome-jackrabbit-ab7924@nitro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Good day!

I plan to migrate the linux-hwmon@vger.kernel.org list to the new
infrastructure this week. We're still doing it list-by-list to make sure that
we don't run into scaling issues with the new infra.

The migration will be performed live and should not require any downtime.
There will be no changes to how anyone interacts with the list after
migration is completed, so no action is required on anyone's part.

Please let me know if you have any concerns.

Best wishes,
-K
