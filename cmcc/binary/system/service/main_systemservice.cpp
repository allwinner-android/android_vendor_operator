/*
 * Copyright (C) 2011 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//init system for cmcc-wasu
//the process will be start in cmcc-wasu platform, and do some work befor boot complete

#include <sys/types.h>
#include <unistd.h>
#include <utils/Log.h>
#include "SystemService.h"
#include <private/android_filesystem_config.h>

using namespace android;

int main(int argc, char** argv){
    ALOGD("init system before booting complete");
    SystemService::init();
}
