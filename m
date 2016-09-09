Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:58706 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750839AbcIIEZt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Sep 2016 00:25:49 -0400
Subject: Re: [PATCH v3] hwmon: xgene: Fix crash when alarm occurs before
 driver probe
To: Hoan Tran <hotran@apm.com>, Jean Delvare <jdelvare@suse.com>
References: <1473352390-30781-1-git-send-email-hotran@apm.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Itaru Kitayama <itaru.kitayama@riken.jp>, lho@apm.com,
        Duc Dang <dhdang@apm.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <35107ad4-b0f3-4d12-4650-4e7656ed66ea@roeck-us.net>
Date: Thu, 8 Sep 2016 21:25:39 -0700
MIME-Version: 1.0
In-Reply-To: <1473352390-30781-1-git-send-email-hotran@apm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/08/2016 09:33 AM, Hoan Tran wrote:
> The system crashes during probing xgene-hwmon driver when temperature
> alarm interrupt occurs before.
> It's because
>  - xgene_hwmon_probe() requests mailbox channel which also enables
> the mailbox interrupt.
>  - As temperature alarm interrupt is pending, ISR runs and crashes when accesses
> into invalid resourse as unmapped PCC shared memory.
>
> This patch fixes this issue by saving this alarm message and scheduling a
> bottom handler after xgene_hwmon_probe() finish.
>
> Signed-off-by: Hoan Tran <hotran@apm.com>
> Reported-by: Itaru Kitayama <itaru.kitayama@riken.jp>
> ---

Applied to -next.

Thanks,
Guenter


