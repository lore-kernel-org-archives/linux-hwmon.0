Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:35184 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752032AbcIPILh (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 16 Sep 2016 04:11:37 -0400
Date: Fri, 16 Sep 2016 10:11:27 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Harry Wei <harryxiyou@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@zh-kernel.org,
        Markus Heiser <markus.heiser@darmarit.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 07/17] SubmitChecklist: rename to RST and add to the
 development-proccess book
Message-ID: <20160916101127.77958af9@endymion>
In-Reply-To: <3955b817eeabc06c9088b4b59722c5e35c175e67.1473893776.git.mchehab@s-opensource.com>
References: <cover.1473893776.git.mchehab@s-opensource.com>
        <3955b817eeabc06c9088b4b59722c5e35c175e67.1473893776.git.mchehab@s-opensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, 14 Sep 2016 20:05:52 -0300, Mauro Carvalho Chehab wrote:
> Add it to the development-process book, by renaming it to
> SubmitChecklist.rst and move it to the development-process
> directory.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> ---
>  .../{SubmitChecklist => development-process/SubmitChecklist.rst}      | 2 +-
>  Documentation/development-process/index.rst                           | 1 +
>  Documentation/hwmon/submitting-patches                                | 2 +-
>  Documentation/ja_JP/SubmitChecklist                                   | 4 ++--
>  Documentation/ja_JP/SubmittingPatches                                 | 2 +-
>  Documentation/zh_CN/SubmittingPatches                                 | 2 +-
>  6 files changed, 7 insertions(+), 6 deletions(-)
>  rename Documentation/{SubmitChecklist => development-process/SubmitChecklist.rst} (98%)
> (...)

For the hwmon part:

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
